require "../../app/models/product.rb"

#test

describe Product do
  it "should be invalid without title and description" do
    product = Product.new
    product.title = 'qwerty'
    product.description = 'dasdsadaqwr.pl'
    product.should_be_valid
  end
end
