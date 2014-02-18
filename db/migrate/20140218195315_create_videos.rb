class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
			t.string :name
			t.string :url
      t.timestamps
		end
		add_index :videos, :url
  end
end
