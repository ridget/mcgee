class Types::AbilityScore < GraphQL::Schema::Object
  field :id, ID, null: false
  field :ability, Types::Ability, null: false
  field :base_score, Int, null: false
  field :total_score, Int, null: false
  field :modifier, Int, null: false
  field :racial_bonus, Int, null: false
  field :misc_bonus, Int, null: false
end
