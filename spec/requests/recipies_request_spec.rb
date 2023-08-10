require 'rails_helper'

describe Recipe, type: :request do
  describe 'authenticated user' do
    before(:each) do
      @user = User.create!(name: 'John', email: 'john@example.com', password: 'password')
      @recipe = Recipe.create(name: 'test recipe', preparation_time: 1, cooking_time: 1, description: 'testing', user: @user)
      @food = Food.create(name: 'rice', measurement_unit: 'grams', price: 5.99, quantity: 2, user: @user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    old_count = Recipe.count

    it 'renders the index template and assigns @recipes' do
      get recipies_path
      expect(response).to be_successful
      expect(response).to render_template(:index)
      expect(response.body).to include('test recipe')
    end

    it 'render and show Add Recipe button' do
      get recipies_path
      expect(response).to be_successful
      expect(response.body).to include('Add Recipe')
    end

    it 'should assigns @recipe and @foods' do
      get recipies_path(id: @recipe.id)
      expect(response).to be_successful
      expect(response.body).to include('delete')
      expect(response.body).to include('testing')
    end

    it 'creates a new recipe and redirects to recipes_path on success' do
      recipe_params = { name: 'New Recipe', preparation_time: 10, cooking_time: 20, description: 'Test description',
                        public: true }
      post '/recipies', params: { recipe: recipe_params }
      expect(response).to redirect_to(user_session_path)
      expect(Recipe.count).to eq(old_count + 1)
    end
  end
end
