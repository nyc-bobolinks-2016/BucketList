module PersonalitiesHelper

  def get_personality(content)
    profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"
    client = RestClient::Resource.new(profile_api_url, ENV["WATSON_API_KEY"], ENV["WATSON_API_SECRET"])
    insights = client.post content, :content_type => "text/plain"
    @scores = JSON.parse(insights)
  end

  def big_five_data(trait)
    @color_hash = {
      "Openness" => "#ff6f00",
      "Conscientiousness" => "#00838f",
      "Extraversion" => "#558b2f",
      "Agreeableness" => "#ad1457",
      "Emotional range" => "#4527a0"
    }
    @border_color_hash = {
      "Openness" => "#ff6f00",
      "Conscientiousness" => "#00838f",
      "Extraversion" => "#558b2f",
      "Agreeableness" => "#ad1457",
      "Emotional range" => "#4527a0"
    }
    {
      labels: [trait["name"]],
      datasets: [
        {
            label: "Percentile",
            backgroundColor: @color_hash[trait["name"]],
            borderColor: @border_color_hash[trait["name"]],
            data: [(trait["percentile"]*100).round(2)],
            hoverBorderWidth: 2
        }
      ]
    }
  end

  def big_five_options
    {
      legend: false,
      width: 400,
      height: 30,
      scales: {
        gridLines: {display: false},
        xAxes: [{
          display: false,
            gridLines: {display: false},
            ticks: {min: 0, max:100}
       }],
        yAxes: [{
          display: false,
            gridLines: {display: false},
       }]
    }}
  end

  def sub_trait_data(trait)
    @labels = []
    @data = []

    @color_hash = {
      "Openness" => ["#ff8f00", "#ffa000", "#ffb300", "#ffc107", "#ffca28", "#ffd54f"],
      "Conscientiousness" => ["#0097a7", "#00acc1", "#00bcd4", "#26c6da", "#4dd0e1", "#80deea"],
      "Extraversion" => ["#689f38", "#7cb342", "#8bc34a", "#9ccc65", "#aed581", "#c5e1a5"],
      "Agreeableness" => ["#c2185b", "#d81b60", "#e91e63", "#ec407a", "#f06292", "#f48fb1"],
      "Emotional range" => ["#512da8", "#5e35b1", "#673ab7", "#7e57c2", "#9575cd", "#b39ddb"]
    }

    @border_color_hash = {
      "Openness" => "#ff6f00",
      "Conscientiousness" => "#00838f",
      "Extraversion" => "#558b2f",
      "Agreeableness" => "#ad1457",
      "Emotional range" => "#4527a0"
    }

    trait["children"].each do |sub_trait|
      @labels << sub_trait["name"]
      @data << (sub_trait["percentile"]*100).round(2)
    end
    {
      labels: @labels,
      datasets: [
        {
            label: "Percentile",
            backgroundColor: @color_hash[trait["name"]],
            borderColor: @border_color_hash[trait["name"]],
            data: @data,
            hoverBorderWidth: 2
        }
      ]
    }
  end

  def sub_trait_options
    {
      legend: false,
      width: 400,
      height: 70,
      scales: {
      xAxes: [
          {
            display: false,
            gridLines: {display: false},
            ticks: {
              min: 0,
              max:100,
              fontColor: "white",

            }
          }
      ],
        yAxes: [
          {
            gridLines: {display: false},
            scaleLabel: {
              display: false
            },
            ticks: {
              fontSize: 14,
              fontColor: "white"
            }
          }
        ],

    }}
  end

  def radar_data(category)
    @labels = []
    @data = []
    category.each do |sub_trait|
      @labels << sub_trait["name"]
      @data << (sub_trait["percentile"]*100).round(2)
    end
    {
      labels: @labels,
      datasets: [
        {
            pointBackgroundColor: "red",
            label: "Percentile",
            backgroundColor: "rgba(33, 150, 243, 0.5)",
            borderColor: "rgba(33, 150, 243, 1)",
            data: @data,
        }
      ]
    }
  end

  def radar_options(name)
    {
      title: {
            display: true,
            text: name,
            fontColor: "white",
            fontSize: 18
        },

      legend: {
        labels:{
          fontColor:"white",
          fontSize: 12
          }
        },
      border: 1,
      width: 100,
      height: 70,

    }
  end

  def likely_preferences(consumption_preferences)
    @likely = []
    consumption_preferences.each do |category|
      category["consumption_preferences"].each do |preference|
        @likely << preference["name"][10..-1] if preference["score"] > 0.5
      end
    end
    @likely
  end

  def unlikely_preferences(consumption_preferences)
    @unlikely = []
    consumption_preferences.each do |category|
      category["consumption_preferences"].each do |preference|
        @unlikely << preference["name"][10..-1] if preference["score"] < 0.5
      end
    end
    @unlikely
  end

end
