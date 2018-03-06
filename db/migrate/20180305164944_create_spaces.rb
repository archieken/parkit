class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.text :address
      t.float :price
      t.string :photo
      t.float :avg_rating
      t.string :parking_type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
