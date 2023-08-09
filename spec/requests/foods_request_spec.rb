require 'rails_helper'

describe Food, type: :request do
  describe 'foods route should be available' do
    before(:each) do
      @captain = User.create!(name: 'Captain',
                           email: 'test@example.com',
                           password: 'kagawa', password_confirmation: 'kagawa')
      @rice = Food.create(name: 'rice', measurement_unit: 'grams', price: 5.99, quantity: 2, user: @captain)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@captain)
    end

    it 'should render the food index action correctly' do
      get foods_path
      expect(response).to be_successful
      expect(response.body).to include('rice')
    end

    it 'should allow users to create foods' do
      get foods_path
      expect(response).to be_successful
      expect(response.body).to include('Add Food')
    end
  end
end
