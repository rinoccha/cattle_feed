class CreateCowFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :cow_feeds do |t|
      t.references :cow,      null: false, foreign_key: true
      t.references :feed,     null: false, foreign_key: true
      t.integer :volume,      null: false
      t.timestamps
    end
  end
end
