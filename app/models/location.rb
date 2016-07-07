class Location < ActiveRecord::Base
  self.table_name = "location"
  belongs_to :destination
  has_many :accommodations
end
