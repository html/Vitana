class Page < ActiveRecord::Base
  has_many :images
  belongs_to :category
  has_attached_file :image, :styles => { :original => "145x110#" }

  def typus_name
    title
  end
end
