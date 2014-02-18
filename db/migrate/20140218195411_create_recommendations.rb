class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
			t.integer 'from_id'.to_sym
			t.integer 'to_id'.to_sym
      t.timestamps
		end
		add_index :recommendations, :from_id
		add_index :recommendations, :to_id
  end
end
