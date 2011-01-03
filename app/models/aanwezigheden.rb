class Aanwezigheden < ActiveRecord::Base
	validates :id_student, :id_docent, :aanwezig, :presence => true	
end