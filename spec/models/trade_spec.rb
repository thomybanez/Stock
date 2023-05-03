require 'rails_helper'

RSpec.describe Trade, type: :model do
    describe "User-Trade association" do
        it "associates a trade with a user" do
          user = User.create(email: "test@example.com", password: "password")
          trade = Trade.create(user_id: user.id)
      
          expect(user.id).to eq(user_id)      
        end
    end



end