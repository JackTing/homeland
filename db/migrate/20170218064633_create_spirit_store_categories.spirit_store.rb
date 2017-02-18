# This migration comes from spirit_store (originally 20161026040805)
class CreateSpiritStoreCategories < ActiveRecord::Migration[5.0]
	def self.up
		create_table :spirit_store_categories do |t|
			t.string :name
			t.string :icon
			t.boolean :is_system

			t.integer :parent_id, :null => true, :index => true
	    t.integer :lft, :null => false, :index => true
	    t.integer :rgt, :null => false, :index => true

	    # optional fields
	    t.integer :depth, :null => false, :default => 0
	    t.integer :children_count, :null => false, :default => 0

			t.timestamps
		end
	end

	def self.down
    drop_table :spirit_store_categories
  end
  
end
