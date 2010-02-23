class Page < ActiveRecord::Base
  belongs_to :category
  has_attached_file :image, :styles => { :original => "145x110#" }
end
