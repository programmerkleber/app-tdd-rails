class Animal < ApplicationRecord
  validates :name, :type_animal, presence: true

  def self.teste
    a = 1
    b = 2
    binding.pry

    a + b
  end
end
