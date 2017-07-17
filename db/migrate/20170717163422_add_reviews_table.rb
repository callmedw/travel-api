class AddReviewsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.column :author, :string
      t.column :body, :string
      t.column :rating, :integer
      t.column :destination_id, :integer
      t.timestamps
    end
  end
end
