class Category < ApplicationRecord
    has_one_attached :category_image
    has_many :services, dependent: :destroy
    validates_uniqueness_of :name
end
