class Types::Query < GraphQL::Schema::Object
  field :player_character, Types::PlayerCharacter, null: false, resolve: -> (_o, _c, _a) do
    OpenStruct.new(id: 1, name: "Mcgee")
  end

  field :playable_classes, resolver: Resolvers::PlayableClasses
end
