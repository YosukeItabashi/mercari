class AddRandomToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :random, :string
  end
end
