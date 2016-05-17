class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.string :name
      t.string :address
      t.decimal :daily_price
      t.decimal :weekly_price
      t.string :description
      t.boolean :has_food
      t.boolean :has_drink
      t.boolean :has_wifi
      t.string :phone_number
      t.integer :max_people
      t.references :user, index: true, foreign_key: true
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
