class AddCreatorToTimeline < ActiveRecord::Migration
  def change
    add_column :timelines, :creator_id, :integer, null: false
  end
end
