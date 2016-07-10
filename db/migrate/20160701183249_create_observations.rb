class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.integer :created_by
      t.datetime :sighted_at
      t.string :description
      t.string :pic
      t.string :phone

      t.timestamps
    end
  end
end
