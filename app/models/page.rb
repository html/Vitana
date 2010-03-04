class Page < ActiveRecord::Base
  has_many :images
  belongs_to :category
  has_attached_file :image, :styles => { :original => "145x110#" }, :default_url => '/images/missing140x110.png'

  def typus_name
    title
  end
end
