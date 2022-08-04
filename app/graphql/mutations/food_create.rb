module Mutations
  class FoodCreate < BaseMutation
    argument :name, String, required: true
    argument :place_of_origin, String, required: true
    argument :image, String, required: true

    # to indicate our response fields
    type Types::FoodType

    # ** --> double splat and it passes in a hash to the resolve method
    # For the sake of simplicity, we use the double splat for the >= three arguments.
    def resolve(**args)
      Food.create!(args)
    end
  end
end
