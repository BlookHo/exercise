class AddDefaultsToColumnsInGroupEvents < ActiveRecord::Migration[5.0]
  def change
    change_column :group_events, :published, :boolean, :default => false
    change_column :group_events, :deleted, :boolean, :default => false
  end
end
