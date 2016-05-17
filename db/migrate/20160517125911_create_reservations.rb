class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.text :comment
      t.integer :rating
      t.integer :price
      t.references :user, index: true, foreign_key: true
      t.references :space, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
