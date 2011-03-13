require "spec_helper"

describe CartItem do
  
  let(:some_title) { "ble" }
  let(:some_price) { 5 }
  let(:some_product) do 
    double(
      "proudct", 
      :title => some_title, 
      :price => some_price
    )
  end
  
  subject { described_class.new(some_product) }

  describe "#initialize" do

    it "initializes cart_item with given product" do
      subject.product.should == some_product
    end

    it "initializes cart_item with quantity 1" do
      subject.quantity.should == 1
    end

  end

  describe "#increment_quantity" do
    it "increments product's quantity" do
      subject.increment_quantity.should == 2
    end
  end

  describe "#title" do
    it "gets title" do
      subject.title.should == some_title
    end
  end

  describe "#price" do
    it "calculates price" do
      subject.increment_quantity
      subject.price.should == some_price * subject.quantity
    end
  end

end
