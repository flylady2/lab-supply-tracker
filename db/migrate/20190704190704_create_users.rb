class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.belongs_to :laboratory, foreign_key: true
      t.boolean :admin, default: "0"

      t.timestamps
    end
  end
end
