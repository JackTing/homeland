# This migration comes from spirit_store (originally 20161028152038)
class CreateSpiritStoreOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :spirit_store_orders do |t|
      t.integer :user_id
      t.integer :plugin_id
      t.integer :quantity
      t.integer :discount,:default=> 0
      t.decimal :price ,:precision => 8, :scale => 2, :default => 0.0
      t.string  :trade_no
      t.string  :state,:default=>'opening'
      t.integer :expire_at
      t.string  :out_trade_no

      t.timestamps
    end
  end
end
