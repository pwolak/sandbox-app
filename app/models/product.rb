require "at_least_a_cent_validator"

class Product < ActiveRecord::Base

  # ML I updated the validations to be "Rails 3 style"
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :price, :numericality => true, :at_least_a_cent => true
  validates :image_url, :presence => true, :format => {
    :with => /\.(gif|jpg|png)$/i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }

  def self.find_products_for_sale
    find(:all, :order => "title")
  end
  
end