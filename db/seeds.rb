party = Party.create!(name: 'The Returned')
[:druid, :bard].each { |class_name| PlayableClass.create!(name: class_name) }
[{name: "McGee", class: :druid, eyes: "copper", hair: "black"}, {name: "Leonor", class: :bard, hair: "black", eyes: "brown"}].each do |character|
  player_character = PlayerCharacter.create(name: character[:name], level: 6, party: party)
  playable_class = PlayableClass.find_by(name: character[:class])
  player_class = PlayerClass.create!(player_character: player_character, playable_class: playable_class)

  ["STR", "DEX", "CON", "INT", "WIS", "CHA"].map do |ability|
    player_character.ability_scores.create(ability: ability, score: rand(8..18))
  end
end
