class Product < ApplicationRecord
  belongs_to :categories

  validates :name, :price, :qty, presence:true

end
