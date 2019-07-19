class RemoveCategoryFromReagent < ActiveRecord::Migration[5.2]
  def change
    remove_column :reagents, :category, :string
  end
end
