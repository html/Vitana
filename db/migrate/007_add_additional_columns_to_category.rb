class AddAdditionalColumnsToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :show_answers, :boolean
    add_column :categories, :show_gallery, :boolean
  end

  def self.down
    remove_column :categories, :show_answers
    remove_column :categories, :show_gallery
  end
end
