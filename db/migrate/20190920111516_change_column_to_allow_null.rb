class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :products, :stock,:string,  null: true
    change_column :products, :sold_at,:string,  null: true # null: trueを明示する必要がある
  end

  def down
    change_column :products, :stock, :string, null: false
    change_column :products, :sold_at, :string, null: false
  end
end
