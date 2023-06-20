require 'rails_helper'

RSpec.describe User, type: :model do
 
  describe 'create' do
      before { User.delete_all }
      it 'persists a User to the database' do
          user = FactoryBot.build(:user) # Build a User instance using FactoryBot
          expect(user.save).to be true # Ensure that the User is saved to the database
          expect(User.count).to eq(1) # Ensure that there is one User in the database
          expect(User.first.email).to eq(user.email) # Ensure that the User in the database has the same email as the one we created
      end
  end
end