# This migration comes from spirit_store (originally 20161027015938)
class CreateSpiritStorePlugins < ActiveRecord::Migration[5.0]
  def change
    create_table :spirit_store_plugins do |t|
    	t.integer :category_id
      t.string :title
      t.text :body
      t.text :body_html
      t.string :author
      t.string :support
      t.string :version
      t.string :icon
      t.string :name,unique: true
      t.decimal :price,:default=>0
      t.boolean :is_system
      t.boolean :is_public
      t.integer :publisher_id
      t.boolean :approved
      t.string  :platforms
      t.integer :use_day
      t.integer :comments_count,:default => 0
      t.integer :plugin_lib_id,:null=>true
      t.boolean :run_in_root,:default => false
      t.integer :score,:default=>0
      t.timestamps
    end
  end
end
