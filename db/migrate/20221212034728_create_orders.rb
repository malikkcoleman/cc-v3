class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :province
      t.string :total

      t.timestamps
    end
  end
end
