Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :category, CategoryType do
    argument :id, types.ID
    resolve -> (obj, args, ctx) {
      Category.find(args["id"])
    }
  end

  field :action_items, ActionItemType.to_list_type do
    resolve -> (obj, args, ctx) {
      ActionItem.all
    }
  end

end
