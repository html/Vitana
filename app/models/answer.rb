class Answer < ActiveRecord::Base
  def self.random_two
    find(:all, :order => 'RANDOM()', :limit => 2)
  end
end
