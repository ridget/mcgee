class Types::Query < GraphQL::Schema::Object
  field :player_character, Types::PlayerCharacter, null: false, resolve: -> (_o, _c, _a) do
    OpenStruct.new(id: 1, name: "Mcgee", hair: "black", eyes: "copper")
  end
end
