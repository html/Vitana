class Image < ActiveRecord::Base
  has_attached_file :image, :styles => {
    :thumbnail => ["310x180#", :jpg]
  }

  def self.random_three
    all(:order => 'RANDOM()', :limit => 3)
  end
end
