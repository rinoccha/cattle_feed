class CreateCows < ActiveRecord::Migration[6.0]
  def change
    create_table :cows do |t|
      t.integer :number,          null:false
      t.date :birth_day
      t.text :memo
      t.references :user,         null: false,foreign_key: true
      t.timestamps
    end
  end
end
