require "spec_helper"

describe Cart do

  describe "#initialize" do
    it "initializes cart with empty array" do
      # ML subject variable defaults to an instance of the described class
      # so if you don't pass any params to the initialize method you can 
      # just use the subject variable which is defined implicitly.
      subject.items.should be_empty
    end
  end

  describe "#add_product" do
    
    it "adds product to the cart" do
      product = "some_product"
      subject.add_product(product)
      subject.items.first.product.should == product
    end
    
    it "increments quantity of product which is already in the cart" do
      3.times { subject.add_product("some_product") }
      subject.items.first.quantity.should == 3
    end
  
  end

  describe "#total_price" do
    
    it "calculates total price of products in the cart" do
      some_product1 = mock("product", :price => 6)
      some_product2 = mock("product", :price => 7)
      subject.add_product(some_product1)
      subject.add_product(some_product2)
      subject.total_price.should == some_product1.price + some_product2.price
    end
    
  end

end
