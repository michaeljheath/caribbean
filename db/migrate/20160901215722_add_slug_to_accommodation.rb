class AddSlugToAccommodation < ActiveRecord::Migration
  def change
    add_column :accommodation, :slug, :string
  end
end
