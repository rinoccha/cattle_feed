class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.string :name,           null: false
      t.decimal :price,         null: false, precision: 10, scale: 2
      t.decimal :volume,        null: false, precision: 10, scale: 2
      t.decimal :unit_price,    null: false, precision: 10, scale: 2
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
