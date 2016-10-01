class Accommodation < ActiveRecord::Base
  self.table_name = "accommodation"
  self.primary_key = 'accommodation_id'
  #belongs_to :country

  extend FriendlyId
  friendly_id :name, use: :slugged
end
