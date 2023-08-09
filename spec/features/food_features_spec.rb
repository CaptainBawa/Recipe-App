require 'rails_helper'

RSpec.describe 'food index page', type: :feature do
  before(:each) do
    @captain = User.create!(name: 'Captain',
                            email: 'test@example.com',
                            password: 'kagawa', password_confirmation: 'kagawa')
    @food = Food.create(name: 'rice', measurement_unit: 'grams', price: 5.99, quantity: 2, user: @captain)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@captain)
    visit foods_path
  end

  it 'displays food name' do
    expect(page).to have_content(@food.name)
  end

  it 'displays food measurement_unit' do
    expect(page).to have_content(@food.measurement_unit)
  end

  it 'displays food price' do
    expect(page).to have_content(@food.price)
  end

  it 'displays food quantity' do
    expect(page).to have_content(@food.quantity)
  end

  it 'should take the user to new foods form page' do
    click_link 'Add Food'
    expect(page).to have_current_path(user_session_path)
  end
end
