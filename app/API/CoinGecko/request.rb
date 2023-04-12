require 'rest-client'

module CoinGecko
    class Request
        CG_URL = "https://api.coingecko.com/api/v3"
        def self.call(http_method:, endpoint:, payload: '')
            response = RestClient::Request.execute(
                method: http_method,
                url: "#{CG_URL}#{endpoint}",
                payload: payload.to_json,
                headers: {
                    'accept': 'application/json'
                }
            )
            result = response == '' ? response : JSON.parse(response)

            { code: response.code, status: 'Success', data: result}
        rescue RestClient::ExceptionWithResponse => e
            { code: e.http_code, status: e.message, data: Error.map(e.http_code) }
        end
    end
end