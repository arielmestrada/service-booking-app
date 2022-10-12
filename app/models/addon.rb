class Addon < ApplicationRecord
    belongs_to :service
    validates_presence_of :name, :price
    validates :name, uniqueness: { scope: :service }
end
