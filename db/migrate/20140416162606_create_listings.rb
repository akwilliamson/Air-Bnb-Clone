class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :description
      t.integer :user_id
      t.string :address
      t.attachment :photo

      t.timestamps
    end
  end
end
