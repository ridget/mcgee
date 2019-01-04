class Types::Party < GraphQL::Schema::Object
  field :id, ID, null: false
  field :members, [Types::PlayerCharacter], null: false
end
