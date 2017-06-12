class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :state, presence: true
  validates :postage, presence: true
  validates :region, presence: true
  validates :shipping_date, presence: true
  validates :price, presence: true

  def sold?
    buyer.present?
  end

end
