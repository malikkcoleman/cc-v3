class Product < ApplicationRecord
  belongs_to :Category

  validates :name, :price, :qty, presence: true

  paginates_per 4
end
