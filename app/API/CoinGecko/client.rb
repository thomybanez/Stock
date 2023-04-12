module CoinGecko
    class Client
        def self.retrieve_coin
            Request.call(
                http_method:'get', 
                endpoint:'/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en' 
            )
        end
    end
end