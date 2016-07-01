class CreateObservations < ActiveRecord::Migration[5.0]
  def change
    create_table :observations do |t|
      t.string :posted_by
      t.datetime :sighted_at
      t.string :description
      t.string :pic

      t.timestamps
    end
  end
end
