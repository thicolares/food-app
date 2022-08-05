module Types
  class MutationType < Types::BaseObject
    field :nutrition_update, mutation: Mutations::NutritionUpdate
    field :food_update, mutation: Mutations::FoodUpdate
    field :nutrition_create, mutation: Mutations::NutritionCreate
    field :food_create, mutation: Mutations::FoodCreate
  end
end
