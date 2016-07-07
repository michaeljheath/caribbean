class AccommodationCategory < ActiveRecord::Base
  has_many :accommodations
end
