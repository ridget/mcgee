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

mcgee.player_character_feats.create!(feat: feat, feat_ability_score_increase: feat.ability_score_increase_options.order(created_at: :asc).first)

known_spells = Spell.create!([{name: "Control Flames", description: "You choose nonmagical flame that you can see within range and that fits within a 5-foot cube. You affect it in one of the following ways:

You instantaneously expand the flame 5 feet in one direction, provided that wood or other fuel is present in the new location.

You instantaneously extinguish the flames within the cube.

You double or halve the area of bright light and dim light cast by the flame, change its color, or both. The change lasts for 1 hour.

You cause simple shapes—such as the vague form of a creature, an inanimate object, or a location—to appear within the flames and animate as you like. The shapes last for 1 hour.

If you cast this spell multiple times, you can have up to three of its non-instantaneous effects active at a time, and you can dismiss such an effect as an action."}, {name: "Frostbite", description: "You cause numbing frost to form on one creature that you can see within range. The target must make a Constitution saving throw. On a failed save, the target takes 1d6 cold damage, and it has disadvantage on the next weapon attack roll it makes before the end of its next turn.

The spell’s damage increases by 1d6 when you reach 5th level (2d6), 11th level (3d6), and 17th level (4d6)."},
                              {name: "Stinking Cloud", description: "You create a 20-foot-radius sphere of yellow, nauseating gas centered on a point within range. The cloud spreads around corners, and its area is heavily obscured. The cloud lingers in the air for the duration.

Each creature that is completely within the cloud at the start of its turn must make a Constitution saving throw against poison. On a failed save, the creature spends its action that turn retching and reeling. Creatures that don't need to breathe or are immune to poison automatically succeed on this saving throw.

A moderate wind (at least 10 miles per hour) disperses the cloud after 4 rounds. A strong wind (at least 20 miles per hour) disperses it after 1 round."}
                             ])

mcgee.player_character_spells.create(known_spells.map { |k| {spell: k, prepared: [true,false].sample} })




