require "../../app/models/cart_item"

describe "Cart item" do
  attr_reader :product
  it "should increment quantity by 1" do

    quan = product.initialize(product)
    quan.quantity.should == 1
  end
end
