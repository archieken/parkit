class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :phone
      t.text :description
      t.string :avatar
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
