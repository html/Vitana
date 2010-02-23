class AddContentToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :content, :text
  end

  def self.down
    remove_column :categories, :content
  end
end
