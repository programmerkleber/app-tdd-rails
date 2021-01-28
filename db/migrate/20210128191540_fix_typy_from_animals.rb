class FixTypyFromAnimals < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :animals, :category, :category_animal
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
