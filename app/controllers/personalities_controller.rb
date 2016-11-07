require 'rest-client'

class PersonalitiesController < ApplicationController

  include TwitterModule
  include PersonalitiesHelper

  def show
    @personality = Personality.find(params[:id])
    @scores = @personality.parse_personality
    @mb_type = @personality.convert_to_mb
    if current_user
      @personality = Personality.find(params[:id])
      @scores = @personality.parse_personality
    else
      flash[:notice] = "Please log in to view this page."
      redirect_to '/login'
    end
  end

  def new
    @personality = Personality.new
    '/load'
  end

  def create
    if params[:personality][:text]
      uploaded = upload(params[:personality][:text])
    end

    @content = params["text_to_analyze"]

    if uploaded
        @content += uploaded
    end

    @personality = Personality.new
    @personality.user = current_user

    unless params["@twitter"] == ""
      @twitter_feed = search(params["@twitter"])
      @tweet_transcript = parse_tweets(@twitter_feed)
      @content += "\n #{@tweet_transcript}"
    end
    if @content.split.count > 100
      @scores = get_personality(@content)
      @personality.scores = JSON.generate(@scores)
      @personality.map_big_five(@scores)
      @personality.save
      redirect_to @personality
    else
      flash[:error] = "Not enough words! \n Must have 100 or more."
      redirect_to new_personality_path
    end
  end

  def load
    sleep 2
    redirect_to 'new_personality_path'
  end

  def upload(text)
    begin
      uploaded_io = text
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end

      file = 'public/uploads/'+ uploaded_io.original_filename
      doc = ""

      if uploaded_io.content_type == "application/pdf"
        doc = read_pdf(file)
      else
        doc = Docx::Document.open(file).text
      end
    rescue
        return nil
    end
    doc
  end

  def read_pdf(file)
    str = ""
    reader = PDF::Reader.new(file)
    reader.pages.each do |page|
          str += page.text
    end
    str
  end

end
