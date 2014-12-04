class Movie < ActiveRecord::Base
	belongs_to :directors
	validates :title, :presence => true
end
