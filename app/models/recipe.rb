class Recipe < ActiveRecord::Base
  belongs_to :categories
  has_many :ingredients, through: :quantities
  has_many :quantities
end
