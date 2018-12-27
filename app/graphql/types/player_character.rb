class Types::PlayerCharacter < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :class, Types::PlayerClass, null: false, resolve: -> (_o, _c, _a) do
    OpenStruct.new(level: 3, name: "WIZARD")
  end
end
