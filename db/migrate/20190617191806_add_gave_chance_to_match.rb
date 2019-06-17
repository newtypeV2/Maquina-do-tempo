class AddGaveChanceToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :matches, :gave_chance, :boolean
  end
end
