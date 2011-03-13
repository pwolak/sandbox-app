require "spec_helper"

describe User do

  describe "validations" do

    it "validates presence of password and email" do
      # ML These are in fact invalid attributes (contrary to valid attributes)
      invalid_attributes = {:password => nil, :email => nil}
      u = User.new(invalid_attributes)
      u.should have(1).error_on(:password)
      u.should have(1).error_on(:email)
    end

    it "validates uniqueness of email" do
      user1 = User.new(:email => "mailmail@com.pl", :password => "qwer")
      user1.save
      user2 = User.new(:email => "mailmail@com.pl", :password => "qwert")
      user2.should_not be_valid
    end

    it "validates confirmation of password" do
      user = User.new(:email => "mail@com.pl", :password => "pass")
      user.password_confirmation = "qwerfdslhf"
      user.should_not be_valid
    end

  end
  
  describe "callbacks" do
    
    describe "before save" do
    
      it "hashes password" do
        user = User.new(:email => "mail@com.pl", :password => "xzc")
        user.save
        user.password_hash.should_not be_nil
      end
    
    end
    
  end

  # ML This is class method (not instance method), thus the describe text starts with
  # a dot not a hash
  describe ".authenticate" do
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
