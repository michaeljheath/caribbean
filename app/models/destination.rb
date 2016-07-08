class Destination < ActiveRecord::Base
  self.table_name = "destination"
  belongs_to :country
end
