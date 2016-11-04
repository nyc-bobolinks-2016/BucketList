class WelcomeController < ApplicationController
  include TwitterModule

  def index
    search("jesusmarlima")
  end
end
