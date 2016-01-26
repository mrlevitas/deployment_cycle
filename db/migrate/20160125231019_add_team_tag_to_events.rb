class AddTeamTagToEvents < ActiveRecord::Migration
  def change
    add_column :events, :team_tag, :string, default: 'none'
  end
end
