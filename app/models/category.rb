class Category < ActiveRecord::Base
  acts_as_list
  has_many :pages
  acts_as_tree  :order => "position"
  validate :validates_max_nest_level
  has_attached_file :image, :styles => { :original => "145x110#" }, :default_url => '/images/missing140x110.png'

  def typus_name
    title
  end

  def validates_max_nest_level
    p = self
    nest_level = 1
    max_nest_level = 2
    while(p = p.parent)
      nest_level += 1

      if p == self
        return errors.add_to_base('Record cannot be self parent')
      elsif max_nest_level < nest_level
        return errors.add_to_base('Max nest level exceeded')
      end
    end
  end
end
