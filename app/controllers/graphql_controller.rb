class GraphqlController < ApplicationController
  def index
  end

  def execute
    variables = params[:variables]
    query = params[:query]
    operation_name = params[:operationName]
    result = McgeeSchema.execute(query,
                                 variables: variables,
                                 context: {},
                                 operation_name: operation_name)
    render json: result
  end
end
