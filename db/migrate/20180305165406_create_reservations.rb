class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :start
      t.date :end
      t.string :status
      t.float :total_cost
      t.text :description
      t.references :space, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
