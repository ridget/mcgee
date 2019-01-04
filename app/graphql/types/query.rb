class Types::Query < GraphQL::Schema::Object
  field :player_character, Types::PlayerCharacter, null: false

  def player_character
    ::PlayerCharacter.find_by(name: "McGee")
  end

  field :playable_classes, [Types::PlayableClass], null: false

  def playable_classes
    Types::PlayableClassName.values.keys.map.with_index do |class_name, index|
      OpenStruct.new(id: index, name: class_name)
    end
  end
end
