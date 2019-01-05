class SubRace < Race
  belongs_to :parent_race, class_name: "Race"
end
