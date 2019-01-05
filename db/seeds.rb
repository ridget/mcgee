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
