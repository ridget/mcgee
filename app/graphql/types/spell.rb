class Types::Spell < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :description, String, null: false
end
