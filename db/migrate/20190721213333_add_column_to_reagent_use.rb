class AddColumnToReagentUse < ActiveRecord::Migration[5.2]
  def change
    add_reference :reagent_uses, :lab, foreign_key: true
  end
end
