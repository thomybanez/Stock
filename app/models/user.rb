class User < ApplicationRecord
    has_many :trades, through :wallet
    has_one :wallet
end
