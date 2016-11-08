module PersonalitiesHelper

  def get_personality(content)
    profile_api_url = "https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2016-10-20&consumption_preferences=true&raw_scores=true"
    client = RestClient::Resource.new(profile_api_url, ENV["WATSON_API_KEY"], ENV["WATSON_API_SECRET"])
    insights = client.post content, :content_type => "text/plain"
    @scores = JSON.parse(insights)
  end

  def big_five_data(trait)
    {
      labels: [trait["name"]],
      datasets: [
        {
            label: "Percentile",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            borderColor: "rgba(54, 162, 235, 1)",
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
    trait["children"].each do |sub_trait|
      @labels << sub_trait["name"]
      @data << (sub_trait["percentile"]*100).round(2)
    end
    {
      labels: @labels,
      datasets: [
        {
            label: "Percentile",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            borderColor: "rgba(54, 162, 235, 1)",
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
      height: 30,
      scales: {
      xAxes: [
          {
            display: false,
            gridLines: {display: false},
            ticks: {
              min: 0,
              max:100,
              fontColor: "white"
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
            pointRadius: 5,
            pointBorderWidth: 1,
            pointBackgroundColor: "red",
            label: "Percentile",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            borderColor: "rgba(54, 162, 235, 1)",
            data: @data,
            hoverBorderWidth: 2
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
      scale: {
        scaleLabel: {
          display: false
        },
        fontSize: 0,
      }
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
