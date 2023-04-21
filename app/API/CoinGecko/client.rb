module CoinGecko
    class Client
        def self.retrieve_coin
            Request.call(
                http_method:'get', 
                endpoint:'/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false&locale=en' 
            )
        end
        def self.retrieve_coin_data
            Request.call(
                http_method:'get',
<<<<<<< HEAD

                endpoint:'/coins/bitcoin/ohlc?vs_currency=usd&days=30'
                endpoint:`/simple/price?ids=#{@coin_id}&vs_currencies=usd`
            )
        end
    end
end