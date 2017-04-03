ActionItemType = GraphQL::ObjectType.define do
  name "ActionItem"
  field :id, types.ID
  field :description, types.String
  field :category, CategoryType
end
