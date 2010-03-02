class AddPageIdToImage < ActiveRecord::Migration
  def self.up
    add_column :images, :page_id, :integer
  end

  def self.down
    remove_column :images, :page_id
  end
end
