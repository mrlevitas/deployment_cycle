class AddEventsTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.string :description
      t.datetime :date_and_time, null: false

      t.integer :timeline_id, null: false
      
      t.timestamps null: false
    end
  end
end
