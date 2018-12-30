class Types::PlayerCharacter < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :hair, String, null: true
  field :eyes, String, null: true
  field :age, Int, null: true
end
