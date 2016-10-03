class AddIndexAccommodation < ActiveRecord::Migration
  def change
    add_index :accommodation, :slug
  end
end
