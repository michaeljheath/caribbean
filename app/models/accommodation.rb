class Accommodation < ActiveRecord::Base
  self.table_name = "accommodation"
  self.primary_key = 'accommodation_id'
  belongs_to :location

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_attached_file :photo,
                    :path => "#{ENV['CMS_ROOT']}/public/photo_attachment/:id/:style/:basename.:extension",
                    :url => "#{ENV['CMS_ROOT']}/photo_attachment/:id/:style/:basename.:extension",
                    styles: { thumb: ["300x300#", :jpg] }

  validates_attachment :photo,
                       content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

  def photo_path_thumbnail
     #return ENV['PHOTO_DIR'] + "/" + self.id.to_s + '/thumb/'
  end

  def photo_path_original
    #return ENV['PHOTO_DIR'] + "/" + self.id.to_s + '/original/'
  end
end
