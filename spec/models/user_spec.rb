require 'rails_helper'

RSpec.describe User, type: :model do


  before(:each) do 
		@user = FactoryBot.create(:user)  	
  end

  it "has a valid factory" do
    # vérifie si la factory est valide
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      # vérifie si le user est bien valide
      expect(@user).to be_a(User)
    end
    describe "#email" do
      # vérifie la présence de l'email
		end 
		describe "#phone_number" do
      # vérifie la présence du phone_number
	  end
  end

  context "associations" do
    # vérifie que l'utilisateur a plusieurs réservations en tant que guest
    # it { expect(@user).to have_many(:private_messages).with_foreign_key(:sender_id)  }  
  end


  # pending "add some examples to (or delete) #{__FILE__}"
end
