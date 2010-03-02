class Image < ActiveRecord::Base
  belongs_to :page
  validates_presence_of :page
  validates_attachment_presence :image

  has_attached_file :image, :styles => {
    :thumbnail => ["310x180#", :jpg]
  }

  def self.random_three(page)
    all(:order => 'RANDOM()', :limit => 3, :conditions => {
      :page_id => page.id
    })
  end
end
