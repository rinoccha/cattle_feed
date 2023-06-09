class CreateCowFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :cow_feeds do |t|
      t.references :cow,      null: false, foreign_key: true
      t.references :feed,     null: false, foreign_key: true
      t.decimal :volume,      null: false, precision: 10, scale: 1
      t.timestamps
    end
  end
end
