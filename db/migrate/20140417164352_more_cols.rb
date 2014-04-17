class MoreCols < ActiveRecord::Migration
  def change
    add_column :listings, :jacuzzi, :boolean
    add_column :listings, :dominatrix_dungeon, :boolean
    add_column :listings, :meat_hooks, :boolean
    add_column :listings, :torture_dungeon, :boolean
    add_column :listings, :pit_of_despair, :boolean
    add_column :listings, :smelly_dog, :boolean
  end
end
