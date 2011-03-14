require "spec_helper"

describe ProductsController do

  describe "#index" do
    it "renders the index template" do
      some_products = ['a', 'b', 'c']
      Product.stub(:all).and_return(some_products)
      get :index
      assigns[:products].should == some_products
    end
  end

  describe "#show" do
    it "renders the show template" do
      some_product = "a"
      Product.stub(:find).and_return(some_product)
      get :show, :id => 1
      assigns[:product].should == some_product
    end
  end

  describe "#new" do
    it "renders the new template" do
      some_product = "a"
      Product.stub(:new).and_return(some_product)
      get :new
      assigns[:product].should == some_product
    end
  end

  describe "#edit" do
    it "renders the edit template" do
      some_product = "a"
      Product.stub(:find).and_return(some_product)
      get :edit
      assigns[:product].should == some_product
    end
  end

  describe "#create" do
    it "renders the create template with valid attributes" do
      some_product = Product.new(:title => "adsda", \
                                 :price => 3, \
                                 :description => "dsaf", \
                                 :image_url => "asda.jpg")
      Product.stub(:new).and_return(some_product)
      get :create
      response.should redirect_to(some_product)
      flash[:notice].should == "Product was successfully created."
    end
    it "renders the create template with invalid attributes" do
      some_product = Product.new
      Product.stub(:new).and_return(some_product)
      get :create
      response.should render_template("new")
      assigns[:product].errors.should_not be_blank
    end
  end

  describe "#update" do
    it "updates with valid atrributes" do
      some_product = Product.new
      Product.stub(:find).and_return(some_product)
      some_product.update_attributes(:title => "adsda", \
                                 :price => 3, \
                                 :description => "dsaf", \
                                 :image_url => "asda.jpg")
      get :update
      response.should redirect_to(some_product)
      flash[:notice].should == "Product was successfully updated."
    end
    it "renders the edit templates when try to updates with invalid atrributes" do
      some_product = Product.new
      Product.stub(:find).and_return(some_product)
      some_product.update_attributes(:title => "dasd")
      get :update
      response.should render_template("edit")
      assigns[:product].errors.should_not be_blank
    end
  end

  describe "#destroy" do
    it "destroys product" do
      some_product = Product.create(:title => "adsda", \
                                 :price => 3, \
                                 :description => "dsaf", \
                                 :image_url => "asda.jpg")
      Product.stub(:find).and_return(some_product)
      some_product.should_receive(:destroy)
      get :destroy, :id => 1
      response.should redirect_to(products_url)
    end
  end

end
