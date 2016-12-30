class CreateGroupEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_events do |t|
      t.integer :user_id
      t.datetime :start
      t.datetime :stop
      t.integer :duration
      t.string :name
      t.text :description
      t.text :markdown_description
      t.string :location
      t.boolean :published
      t.boolean :deleted

      t.timestamps
    end
  end
end
