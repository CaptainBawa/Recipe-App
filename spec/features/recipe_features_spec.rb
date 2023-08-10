require 'rails_helper'

RSpec.describe 'recipies page', type: :feature do
  before(:each) do
    @user = User.create!(name: 'John', email: 'john@example.com', password: 'password')
    @recipe = Recipe.create(name: 'test recipe', preparation_time: 1, cooking_time: 1, description: 'testing', user: @user)
    @food = Food.create(name: 'rice', measurement_unit: 'grams', price: 5.99, quantity: 2, user: @user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit recipies_path
  end

  it 'displays recipe name' do
    expect(page).to have_content(@recipe.name)
  end

  it 'displays delete button' do
    expect(page).to have_content('delete')
  end

  it 'displays recipe description' do
    expect(page).to have_content(@recipe.description)
  end

  it 'should take the user to new foods form page' do
    click_link 'Add Recipe'
    expect(page).to have_current_path(user_session_path)
  end

  it 'should show the public recipies' do
    visit '/public_recipies'
    expect(page).to have_content('Public')
  end
end
