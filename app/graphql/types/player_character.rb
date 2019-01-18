class Types::PlayerCharacter < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, String, null: false
  field :hair, String, null: true
  field :eyes, String, null: true
  field :age, Int, null: true
  field :level, Int, null: false
  field :class, Types::PlayerClass, null: true, method: :player_class
  field :known_spells, [Types::Spell], null: true
  field :prepared_spells, [Types::Spell], null: true

  field :party_members, [Types::PlayerCharacter], null: true do
    argument :names, [String], required: false
  end

  def party_members(names:)
    return object.party_members unless names
    object.party_members.where(name: names)
  end

  field :ability_scores, [Types::AbilityScore], null: false do
    argument :ability, Types::Ability, required: false
  end

  def ability_scores(ability:)
    return object.ability_scores unless ability
    object.ability_scores.where(ability: ability)
  end
end
