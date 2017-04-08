Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :login, field: LoginMutation.field
end
