class McgeeSchema < GraphQL::Schema
  max_depth 5

  log_query_depth = GraphQL::Analysis::QueryDepth.new { |query, depth| Rails.logger.info("[GraphQL Query Depth] #{depth}")}
  query_analyzer(log_query_depth)

  query(Types::Query)
end
