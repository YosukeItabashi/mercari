class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
        t.string      :name, null: false, index: true
        t.string      :image
        t.text        :description
        t.string      :category
        t.string      :state
        t.string      :postage
        t.string      :region
        t.string      :shipping_date
        t.integer     :price
        t.integer     :saler_id
        t.integer     :buyer_id
        t.timestamps
    end
  end
end
