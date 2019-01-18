class Types::Query < GraphQL::Schema::Object
  field :player_character, Types::PlayerCharacter, null: false do
    argument :name, String, required: true
  end

  def player_character(name:)
    ::PlayerCharacter.find_by(name: name)
  end
end
