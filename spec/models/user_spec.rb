require "spec_helper"

describe Product do

  before(:each) do
    @p = Product.new
  end
  
  describe "#add" do
    
    it "adds two numbers" do
      @p.add(2, 3).should == 5
    end

    it "adds 4 to 7" do
      @p.add(4, 7).should == 11
    end

  end
  
  describe "#substract" do
  
    it "substracts one number from another" do
      @p.substract(5, 10).should == -5
    end

  end
  
end
