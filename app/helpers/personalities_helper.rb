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
      "Agreeableness" => "rgba(75, 192, 192, 0.9",
      "Emotional range" => "rgba(153, 102, 255, 0.9)"
    }
    @border_color_hash = {
      "Openess" => "rgba(255, 99, 132, 1)",
      "Conscientiousness" => "rgba(54, 162, 235, 1)",
      "Extraversion" => "rgba(255, 206, 86, 1)",
      "Agreeableness" => "rgba(75, 192, 192, 1)",
      "Emotional range" => "rgba(153, 102, 255, 1)"
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
      "Agreeableness" => ["#", "#", "#", "#", "#", "#"],
      "Emotional range" => ["#", "#", "#", "#", "#", "#"]
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
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
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
            backgroundColor: ["#ff8f00", "#ff5722", "#76ff03", "#18ffff", "#6200ea", "#f50057", "#d500f9", "#1de9b6", "#c6ff00", "#ff174", "#00e676", "#ea80fc" ],
            borderColor: ["#ff8f00", "#ff5722", "#76ff03", "#18ffff", "#6200ea", "#f50057", "#d500f9", "#1de9b6", "#c6ff00", "#ff174", "#00e676", "#ea80fc" ],
            data: @data,
        }
      ]
    }
  end
  ["#ff8f00", "#ff5722", "#76ff03", "#18ffff", "#6200ea", "#f50057", "#d500f9", "#1de9b6", "#c6ff00", "#ff174", "#00e676", "#ea80fc" ]

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
