class CreateReagentUses < ActiveRecord::Migration[5.2]
  def change
    create_table :reagent_uses do |t|
      t.belongs_to :Reagent, foreign_key: true
      t.belongs_to :User, foreign_key: true
      t.string :unit
      t.integer :quantity
      t.datetime :date

      t.timestamps
    end
  end
end
