module NounprojectModule

      def get_icon(id)
        consumer = OAuth::Consumer.new(ENV["NOUN_PROJECT_KEY"], ENV["NOUN_PROJECT_SECRET"])
        access_token = OAuth::AccessToken.new consumer
        endpoint = "http://api.thenounproject.com/icon/"+id

        response = access_token.get(endpoint)

        p response.body
      end

end
