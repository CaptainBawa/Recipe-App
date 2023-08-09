require 'rails_helper'

RSpec.describe Food, type: :model do
  subject { Recipe.create(name: 'rice', preparation_time: 1, cooking_time: 1, description: 'cooking rice is easy') }

  it 'name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description must be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
end
