class ChangeDestinationAttributeName < ActiveRecord::Migration[5.1]
  def change
    change_column :destinations, :destination, :location
  end
end
