class AddPriceToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :price, :integer, default: 10000
  end
end
