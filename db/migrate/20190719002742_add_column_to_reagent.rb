class AddColumnToReagent < ActiveRecord::Migration[5.2]
  def change
    add_reference :reagents, :category, foreign_key: true
  end
end
