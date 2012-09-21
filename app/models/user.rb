

class User < ActiveRecord::Base

  validates   :email, :uniqueness => true, :on => :create,
    :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }

  validates :password, :confirmation => true,
    :length => { :within => 4..20 },
    :presence => true

  has_many :albums


  def self.authenticate(email, pass)
    user = find_by_email(email)
    return user 
  end
  

end
