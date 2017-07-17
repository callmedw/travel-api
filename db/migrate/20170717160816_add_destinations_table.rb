class AddDestinationsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :destinations do |t|
      t.column :destination, :string
    end
  end
end
