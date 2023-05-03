class Wallet < ApplicationRecord
    include ActionView::Helpers::NumberHelper
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
    
    belongs_to :user
    has_many :transfers
  
    def add_balance(amount)      
      self.balance += amount
      self.save!      

      transfer = transfers.create(transaction_type: "Deposit", amount: amount, wallet_id: user_id)  
      reload
      transfer
    end
  
    def subtract_balance(amount)
      self.balance -= amount
      save
      reload
    end
  end
