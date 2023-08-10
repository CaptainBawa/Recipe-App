require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  abel = User.create!(name: Faker::Name.unique.name,
                      email: Faker::Internet.email,
                      password: '1234567', password_confirmation: '1234567')

  recipe = Recipe.create!(name: 'Chicken',
                          preparation_time: '1 hr',
                          cooking_time: '2 hr',
                          description: 'Yemmy drumbs',
                          public: false, user: abel)

  food = Food.create!(name: 'Chicken',
                      quantity: 2,
                      measurement_unit: 'kg',
                      price: 45,
                      user: abel)
  subject do
    RecipeFood.new(recipe_id: recipe.id, food_id: food.id, quantity: 5)
  end

  before { subject.save }

  it 'should have a recipe' do
    subject.recipe_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a food' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'should have a number' do
    subject.quantity = 'abc'
    expect(subject).to_not be_valid
  end

  it 'should have save properlly' do
    expect(subject).to be_valid
  end
end
