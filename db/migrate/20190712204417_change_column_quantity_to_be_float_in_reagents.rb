class ChangeColumnQuantityToBeFloatInReagents < ActiveRecord::Migration[5.2]
  def change
    change_column :reagents, :quantity, :float
  end
end
