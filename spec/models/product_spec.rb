require "spec_helper"

describe Product do

  describe "validations" do 
 
    it "validates presence of title, description and image_url " do
      # ML I changed the name to invalid_attributes, because they are... invalid :)
      # Also no need to make it instance variable ("@invalid_attributes").
      # It suffices to be a local variable ("invalid_attributes").
      invalid_attributes = {
        :title => nil,
        :description => nil,
        :image_url => nil
      }
      p = Product.new(invalid_attributes)
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
     Product.new(:price => nil).should have(1).errors_on(:price)
     Product.new(:price => "ddsa").should have(2).errors_on(:price)
    end
  
  end

  # ML It's a class method so the describe text starts with a dot
  describe ".find_products_for_sale" do
    
    it "finds all products for sale and order them by title" do
      # ML When you want to call :new and then :save, you can just call
      # :create which intializes an instance and sends it to db.
      my_product1 = Product.create(
        :title => "was",
        :description => "fdsfd",
        :image_url => "fsdfdsa.jpg", 
        :price => 10
      )
      my_product2 = Product.create(
        :title => "das", 
        :description => "da", 
        :image_url => "dsa.jpg", 
        :price => 12
      )
      # ML When the order is not important, arrays should be compared
      # using =~ (contrary to ==).
      Product.find_products_for_sale.should =~ [my_product1, my_product2]
    end
    
  end

end
