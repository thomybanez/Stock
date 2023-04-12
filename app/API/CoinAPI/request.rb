require 'rest-client'

module CoinAPI
    class Request
        URL = "https://rest.coinapi.io/v1"
        API_KEY = "1AF01B55-7BA1-4BF0-946A-AB868CE4C772"
        def self.call(http_method:, endpoint:, params: {}, payload: '')
            response = RestClient::Request.execute(
                method: http_method,
                url: "#{URL}#{endpoint}?#{params.to_query}",
                payload: payload.to_json,
                headers: {
                    'Content-type' => 'application/json',
                    'X-CoinAPI-Key' => API_KEY
                }
            )
            result = response == '' ? response : JSON.parse(response)

            { code: response.code, status: 'Success', data: result}
        rescue RestClient::ExceptionWithResponse => e
            { code: e.http_code, status: e.message, data: Error.map(e.http_code) }
        end
    end
end