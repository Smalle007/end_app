class Labo < ActiveRecord::Base
	validates :name, :id_docent, :presence => true
end
