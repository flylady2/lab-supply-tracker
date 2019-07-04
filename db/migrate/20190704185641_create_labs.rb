class CreateLabs < ActiveRecord::Migration[5.2]
  def change
    create_table :labs do |t|
      t.string :principal_investigator
      t.string :location

      t.timestamps
    end
  end
end
