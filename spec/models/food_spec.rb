require 'rails_helper'

RSpec.describe Food, type: :model do
    subject { Food.create(name: 'apply', measurement_unit: 'grams', price: 100, quantity: 2) }

    it 'name must be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'price must be present' do
        subject.price = nil
        expect(subject).to_not be_valid
      end

      it 'quantity must be present' do
        subject.quantity = nil
        expect(subject).to_not be_valid
      end

      it 'measurement_unit must be present' do
        subject.measurement_unit = nil
        expect(subject).to_not be_valid
      end
  
    it 'should be greater than or equal to zero' do
      subject.quantity = -1
      expect(subject).to_not be_valid
    end
  
end