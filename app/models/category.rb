class Category < ApplicationRecord
    has_many :services, dependent: :destroy
    validates_uniqueness_of :name
end
