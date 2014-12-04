class Director < ActiveRecord::Base
  
	has_many :movie, dependent: :destroy
  validates :movie, presence: true

end
