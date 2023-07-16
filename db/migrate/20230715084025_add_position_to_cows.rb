class AddPositionToCows < ActiveRecord::Migration[6.0]
  def change
    add_column :cows, :position, :integer
  end
end
