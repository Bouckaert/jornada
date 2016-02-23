class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rate
      t.text :comment
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
