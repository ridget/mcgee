module Types::PlayableClassInterface
  include GraphQL::Schema::Interface

  description "Primary definition of what your character can do."

  field :id, ID, null: false
  field :name, Types::PlayableClassName, null: false
end
