class User < ApplicationRecord
  has_many :recipies, dependent: :destroy, class_name: 'Recipe'
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
