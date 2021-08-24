module Numbers
    module V1
        class Client
            API_ENDPOINT = 'http://numbersapi.com/'

            def year_fact(year)
                request(
                    http_method: :get,
                    endpoint: "#{year}/year"
                )
            end

            def number_fact(number)
                request(
                    http_method: :get,
                    endpoint: "#{number}"
                )
            end

            def date_fact(month, day)
                request(
                    http_method: :get,
                    endpoint: "#{month}/#{day}/date"
                )
            end

            def math_fact(number)
                request(
                    http_method: :get,
                    endpoint: "#{number}/math"
                )
            end

            def random_fact
                request(
                    http_method: :get,
                    endpoint: "random/trivia"
                )
            end

            

            private

            def request(http_method:, endpoint:, params: {})
                @response = connection.public_send(http_method, endpoint, params)
                parsed_response = @response.body
            end

            def connection
                @connection = @connection || Faraday.new(API_ENDPOINT) do |f|
                    f.request :url_encoded
                    f.adapter Faraday.default_adapter
                end
            end

        end
    end
end