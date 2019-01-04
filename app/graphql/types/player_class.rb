class Types::PlayerClass < GraphQL::Schema::Object
  field :id, ID, null: false
  field :name, Types::PlayableClassName, null: false

  def name
    object.playable_class.name
  end
end
