class Aanwezigheden < ActiveRecord::Base
	validates :student_id, :labo_id, :aanwezig, :presence => true

end
