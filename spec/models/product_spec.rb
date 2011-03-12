require "spec_helper"

describe Product do

  before(:each) do
    @valid_attributes = {:title => "dasda", \
      :description => "aisugf skdgf", \
      :image_url => "asd.jpg"}
  end
 
  it "validates presence of title, description and image_url " do
    @valid_attributes[:title] = nil
    @valid_attributes[:description] = nil
    @valid_attributes[:image_url] = nil
    p = Product.new(@valid_attributes)

    p.should have(1).error_on(:title)
    p.should have(1).error_on(:description)
    p.should have(2).error_on(:image_url)
  end

  it "validates format of image_url" do
    Product.new(:image_url => "foto.jpg").should have(:no).errors_on(:image_url)
    Product.new(:image_url => "foto.gif").should have(:no).errors_on(:image_url)
    Product.new(:image_url => "foto.png").should have(:no).errors_on(:image_url)
    Product.new(:image_url => "foto.jpeg").should have(1).error_on(:image_url)
    Product.new(:image_url => "foto").should have(1).error_on(:image_url)
  end

  it "validates price is at least 0.01" do
    Product.new(:price => 5).should have(:no).errors_on(:price)
    Product.new(:price => 0.01).should have(:no).errors_on(:price)
    Product.new(:price => 0.001).should have(1).error_on(:price)
  end

  it "validates price is a number" do
   Product.new(:price => nil).should have(2).errors_on(:price)
   Product.new(:price => "ddsa").should have(2).errors_on(:price)
  end

  describe "#find_products_for_sale" do
    it "finds all products for sale and order them by title" do
      my_product1 = Product.new(:title => "was", \
                                :description => "fdsfd", \
                                :image_url => "fsdfdsa.jpg", \
                                :price => 10)
      my_product2 = Product.new(:title => "das", \
                                :description => "da", \
                                :image_url => "dsa.jpg", \
                                :price => 12)
      my_product1.save
      my_product2.save
      Product.find_products_for_sale.should == [my_product2, my_product1]
    end
  end

end
