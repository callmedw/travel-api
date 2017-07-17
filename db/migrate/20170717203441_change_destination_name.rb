class ChangeDestinationName < ActiveRecord::Migration[5.1]
  def change
    rename_column :destinations, :destination, :location
  end
end
