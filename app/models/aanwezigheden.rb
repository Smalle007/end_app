class Aanwezigheden < ActiveRecord::Base
	validates :student_id, :docent_id, :aanwezig, :presence => true

end