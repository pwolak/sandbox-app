class User < ActiveRecord::Base
  attr_accessor :password
  
  before_save :encrypt_password
  
  # ML I updated the validations to be "Rails 3 style"
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => { :on => :create }, :confirmation => true

  def self.authenticate(email, password)
    user = find_by_email(email)
    # ML Keep 90 chars per line limit
    if user && user.password_hash == 
        BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end


