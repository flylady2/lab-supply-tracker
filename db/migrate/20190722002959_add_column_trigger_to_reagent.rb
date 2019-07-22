class AddColumnTriggerToReagent < ActiveRecord::Migration[5.2]
  def change
    add_column :reagents, :trigger, :float
  end
end
