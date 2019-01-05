elf = Race.create!(name: "Elf")
human = Race.create!(name: "Human")

wood_elf = SubRace.create!(name: "Wood Elf", parent_race: elf)

wood_elf.ability_score_increases.create([{ability: "DEX", ability_score_bonus: 2}, {ability: "WIS", ability_score_bonus: 1}])

party = Party.create!(name: 'The Returned')
[:druid, :bard].each { |class_name| PlayableClass.create!(name: class_name) }
[{name: "McGee", class: :druid, eyes: "copper", hair: "black", race: wood_elf}, {name: "Leonor", class: :bard, hair: "black", eyes: "brown", race: human}].each do |character|
  player_character = PlayerCharacter.create!(name: character[:name], level: 6, party: party, race: character[:race])
  playable_class = PlayableClass.find_by(name: character[:class])
  player_class = PlayerClass.create!(player_character: player_character, playable_class: playable_class)

  ["STR", "DEX", "CON", "INT", "WIS", "CHA"].map do |ability|
    player_character.ability_scores.create(ability: ability, score: rand(8..18))
  end
end

feat = Feat.create!(name: "Observant", description: "Increase your INT or WIS score by 1. If you can see a creature's mouth while it is speaking a language you understand, you can interpret what it's saying by reading its lips. You have a +5 bonus to your passive Perception and passive Investigation scores.")

feat.ability_score_increase_options.create!([{ability: "WIS", ability_score_bonus: 1}, {ability: "INT", ability_score_bonus: 1}])

mcgee = PlayerCharacter.find_by!(name: "McGee")

mcgee.player_character_feats.create(feat: feat, feat_ability_score_increase: feat.ability_score_increase_options.order(created_at: :asc).first)
