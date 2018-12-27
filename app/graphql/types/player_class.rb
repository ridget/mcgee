class Types::PlayableClassName < GraphQL::Schema::Enum
  value "DRUID", "A Druidic sorceror"
  value "RANGER", "A Druidic sorceror"
  value "WIZARD", "some kind of wizard I guess."
end

class Types::PlayerClass < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, Types::PlayableClassName, null: false
  field :level, Int, null: false
end


class Types::PlayableClass < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, Types::PlayableClassName, null: false
end
