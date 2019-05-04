require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    it "ensures email presence" do
      user = User.new(email: "").save
      expect(user).to eq false
    end

    it "ensures email format" do
      user = User.new(email: "johndoe?@gmail.com").save
      expect(user).to eq false
    end

    it "ensures user has products" do
      user = User.create(email: "johndoe@gmail.com")
      expect(user.products).to eq []
    end

    it "should save successfully" do
      user = User.new(email: "johndoe@gmail.com").save
      expect(user).to eq true
    end
  end
end
