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
    player_character.ability_score_increases.where(ability: ability).pluck(:ability_score_bonus).sum
  end

  def misc_bonus
    1
  end

  def modifier
    DiceRollModifier.calculate(total_score)
  end
end
