module CoinAPI
    class Client
        def self.retrieve_coin
            Request.call(
                http_method:'get', 
                endpoint:'/ohlcv/BINANCE_SPOT_BTC_USDT/latest', 
                params: {
                    period_id: '1MIN',
                    limit: '1440'
                }
            )
        end
    end
end