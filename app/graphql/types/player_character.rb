class Types::PlayerCharacter < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :hair, String, null: true
  field :eyes, String, null: true
  field :age, Int, null: true
  field :level, Int, null: false
  field :class, Types::PlayerClass, null: true, method: :player_class
  field :party_members, [Types::PlayerCharacter], null: true
end
