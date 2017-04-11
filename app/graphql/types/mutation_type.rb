Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :login, LoginMutation.field
end
