class AddPersonalColumnToTimelines < ActiveRecord::Migration
  def change
    add_column :timelines, :personal, :boolean, default: true
  end
end
