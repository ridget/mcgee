class Decorators::AbilityScore < SimpleDelegator
  def label
    ::AbilityScore::ABILITY_LABELS.fetch(ability)
  end

  def base_score
    score
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
end
