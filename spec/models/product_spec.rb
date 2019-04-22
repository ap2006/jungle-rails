require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      # validation tests/examples here
      subject do
      @category = Category.create(name: 'Fruit')
      @category.products.new(
        name: 'Pineapple',
        price: 55,
        quantity: 30
      )
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a price' do
    subject.price_cents = nil
    expect(subject).to_not be_valid
    end

    it 'is not valid without a quantity' do
    subject.quantity = nil
    expect(subject).to_not be_valid
    end

    it 'is not valid without a category' do
    subject.category = nil
    expect(subject).to_not be_valid
    end
  end
end
