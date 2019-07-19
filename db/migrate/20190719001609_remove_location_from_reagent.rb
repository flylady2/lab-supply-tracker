class RemoveLocationFromReagent < ActiveRecord::Migration[5.2]
  def change
    remove_column :reagents, :location, :string
  end
end
