# This migration comes from spirit_store (originally 20161027074229)
class CreateSpiritStoreVersionManagers < ActiveRecord::Migration[5.0]
  def change
    create_table :spirit_store_version_managers do |t|
      t.string :version
      t.text :body
      t.text :body_html
      t.string :source

      t.timestamps
    end
  end
end
