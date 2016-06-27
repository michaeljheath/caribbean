class Accommodation < ActiveRecord::Base
  self.primary_key = 'accommodation_id'
  belongs_to :country
end
