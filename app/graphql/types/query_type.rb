module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_food, [Types::FoodType], null: false, description: 'Get all the food items.'
    # :all_food --> the field name
    # [Types::FoodType] --> the return type for the field
    # null: false --> whether the field will ever be null (false == it will never be null)
    # description: 'Get all the food items.' --> description

    field :food, Types::FoodType, null: false do
      description 'Get a food item based on id.'
      argument :id, ID, required: true
    end

    field :find_food, [Types::FoodType], null: false do
      description 'A set of foods based on place of origin.'
      argument :place_of_origin, String, required: true
    end

    def all_food
      Food.all
    end

    def food(id:)
      Food.find(id)
    end

    def find_food(place_of_origin:)
      # Food.where(place_of_origin: place_of_origin)
      Food.where('place_of_origin like ?', "%#{place_of_origin}%")
    end
  end
end
