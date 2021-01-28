require 'rails_helper'

RSpec.describe Animal, type: :model do

  context 'Validar nome' do
    # exemple 1 (um cenário que você quer testar)
    # "ele(a) é valido"
    it 'é válido' do
      animal = Animal.new name: 'Vaca', category_animal: 'mamifero'
      expect(animal).to be_valid
    end

    # exemple 1
    it 'não é valido' do
      animal = Animal.new category_animal: 'mamifero'
      expect(animal).to_not be_valid
    end

    # Usando os Principios:
    #   1. [inicializar] o que vai ser testado
    #   2. [processar] o que está testando
    #   3. [validar] o teste
    it 'retorna msg error' do
      animal = Animal.new name: nil
      animal.valid?
      expect(animal.errors[:name]).to include('can\'t be blank')
    end
  end

  context 'Validar category_animal' do
    # exemple 1
    it 'ser válido' do
      # um cenário

      # Principios:
      #   1. [inicializar] o que vai ser testado
      #   2. [processar] o que está testando
      #   3. [validar] o teste

      animal = Animal.new name: 'Cachorro', category_animal: 'mamifero'
      expect(animal).to be_valid
    end

    # exemple 1
    it 'não ser válido' do
      animal = Animal.new name: 'Cachorro'
      expect(animal).to_not be_valid
    end
  end
end
