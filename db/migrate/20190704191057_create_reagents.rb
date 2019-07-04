class CreateReagents < ActiveRecord::Migration[5.2]
  def change
    create_table :reagents do |t|
      t.string :name
      t.string :category
      t.string :unit
      t.integer :quantity
      t.string :location
      t.string :source
      t.belongs_to :Laboratory, foreign_key: true
      t.belongs_to :Location, foreign_key: true

      t.timestamps
    end
  end
end
