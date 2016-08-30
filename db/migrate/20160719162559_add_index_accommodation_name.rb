class AddIndexAccommodationName < ActiveRecord::Migration
  def change
    add_index :accommodation, :name
  end
end
