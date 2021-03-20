class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :bring_cards
  has_many :users, through: :bring_cards
  accepts_nested_attributes_for :bring_cards
end
