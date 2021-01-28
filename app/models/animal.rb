class Animal < ApplicationRecord
  validates :name, :category_animal, presence: true
end
