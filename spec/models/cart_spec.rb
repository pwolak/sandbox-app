require "spec_helper"

describe Cart do

  before(:each) do
    @cart = Cart.new
  end

  describe "#initialize" do
    it "initializes cart with empty array" do
      @cart.items.should == []
    end
  end

  describe "#add_product" do
    
    it "adds product to the cart" do
      @cart.items.should == [@cart.add_product("some_product")]
    end
    
    it "increments quantity of product which is already in the cart" do
      2.times{@cart.add_product("some_product")}
      @cart.add_product("some_product").quantity.should == 3
    end
  
  end

  describe "#total_price" do
    it "calculates total price of products in the cart" do
      some_product1 = mock("product", :price => 6)
      some_product2 = mock("product", :price => 7)
      @cart.add_product(some_product1)
      @cart.add_product(some_product2)
      @cart.total_price.should == some_product1.price + some_product2.price
    end
  end

end
