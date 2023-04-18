class TradesController < ApplicationController
    
    def market
        @api = CoinGecko::Client.retrieve_coin[:data]     
    end

    def trade
    end

    def execute
    end

    private
    def coin_params
    end
end