class Types::AbilityScore < GraphQL::Schema::Object
  field :id, ID, null: false
  field :ability, Types::Ability, null: false
  field :base_score, Int, null: false
  field :total_score, Int, null: false
  field :modifier, Int, null: false
  field :racial_bonus, Int, null: false
  field :misc_bonus, Int, null: false

  def base_score
    object.score
  end

  def total_score
    base_score + racial_bonus + misc_bonus
  end

  def racial_bonus
    ability_bonus(player_character.ability_score_increases)
  end

  def misc_bonus
    ability_bonus(player_character.feat_ability_score_increases)
  end

  def modifier
    DiceRollModifier.calculate(total_score)
  end

  private

  def ability_bonus(ability_score_increases)
    ability_score_increases.where(ability: ability).pluck(:ability_score_bonus).sum
  end

  def player_character
    object.player_character
  end
end
