require "spec_helper"

describe User do

  before(:each) do
    @valid_attributes
  end
  
  describe "validates" do

    it "validates presence of password and email" do
      valid_attributes = {:password => nil, :email => nil}
      u = User.new(valid_attributes)
      u.should have(1).error_on(:password)
      u.should have(1).error_on(:email)
    end

    it "validates uniqueness of email" do
      user1 = User.new(:email => "mailmail@com.pl", :password => "qwer")
      user1.save
      user2 = User.new(:email => "mailmail@com.pl", :password => "qwert")
      user2.save.should be_false
    end

    it "validates confirmation of password" do
      user = User.new(:email => "mail@com.pl", :password => "pass")
      user.password_confirmation = "qwerfdslhf"
      user.should_not be_valid
    end

    it "hashes password before save" do
      user = User.new(:email => "mail@com.pl", :password => "xzc")
      user.save
      user.password_hash.should_not == nil
    end

  end

  describe "#authenticate" do
    it "finds the user with given email and pass" do
      user = User.new(:email => "mail@com.pl", :password => "qwerty")
      user.save
      User.authenticate("mail@com.pl", "qwerty").should == user
    end
  end

  describe "#encrypt_password" do
    it "encrypts password" do
      user = User.new(:email => "mail@com.pl", :password => "wqw")
      user.save
      user.password_salt.should_not be_blank
      user.password_hash.should_not be_blank
    end
  end

end
