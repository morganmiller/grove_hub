UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.ID
  field :email, types.String
  field :jwt, types.String
end
