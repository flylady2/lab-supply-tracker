class ChangeColumnQuantityToBeFloatInReagentUses < ActiveRecord::Migration[5.2]
  def change
    change_column :reagent_uses, :quantity, :float
  end
end
