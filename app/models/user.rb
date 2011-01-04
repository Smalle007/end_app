class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :presence => true
	validates :email, :uniqueness => true
	validates :password, :presence => true, :length => { :within => 6..12}
end
