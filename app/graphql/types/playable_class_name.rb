class Types::PlayableClassName < GraphQL::Schema::Enum
  value "DRUID", "Druids are an embodiment of nature’s resilience, cunning, and fury.", value: "druid"
  value "SORCERER", "Sorcerers carry a magical birthright conferred upon them by an exotic bloodline.", value: "sorceror"
  value "BARD", "a bard weaves magic through words and music.", value: "bard"
  value "BARBARIAN", "They can enter a berserk state where rage takes over, giving them superhuman strength and resilience.", value: "barbarian"
  value "ROGUE", "Rogues rely on skill, stealth, and their foes’ vulnerabilities to get the upper hand in any situation", value: "rogue"
end
