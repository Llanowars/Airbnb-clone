class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :rating
      t.references :user, index: true, foreign_key: true
      t.references :space, index: true, foreign_key: true
      t.references :reservation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
