require "test_helper"

class UserTest < ActiveSupport::TestCase
    test "save" do
        user = User.new(email: "t123123est@example.com",password: "123")
        assert user.save
    end
end
