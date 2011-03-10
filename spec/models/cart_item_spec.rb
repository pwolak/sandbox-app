require "spec_helper"

describe CartItem do

  before(:each) do
    @some_title = "ble"
    @some_price = 5
    @some_product = mock("product", :title => @some_title, :price => @some_price)
    @item = CartItem.new(@some_product)
  end

  describe "#initialize" do

    it "initializes cart_item with given product" do
      @item.product.should == @some_product
    end

    it "initializes cart_item with quantity 1" do
      @item.quantity.should == 1
    end

  end

  describe "#increment_quantity" do
    it "increments product's quantity" do
      @item.increment_quantity.should == 2
    end
  end

  describe "#title" do
    it "adds title method to CartItem" do
      @item.title.should == @some_title
    end
  end

  describe "#price" do
    it "calculates price" do
      @item.increment_quantity
      @item.price.should == @some_price * @item.quantity
    end
  end

end
