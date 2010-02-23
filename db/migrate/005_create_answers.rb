class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.string :title
      t.string :content
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
