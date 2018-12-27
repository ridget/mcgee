class Resolvers::PlayableClasses < GraphQL::Schema::Resolver
  type [Types::PlayableClass], null: false

  argument :names, [Types::PlayableClassName], required: false

  def resolve(names: [])
    class_names(names).map.with_index do |class_name, index|
      OpenStruct.new(id: index, name: class_name, level: 3)
    end
  end

  private

  def class_names(names)
    return names if names.present?

    Types::PlayableClassName.values.keys
  end
end
