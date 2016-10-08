class AddIndexAccommodationSlug < ActiveRecord::Migration
  def change
    add_index :accommodation, :slug
  end
end
