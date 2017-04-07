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

  field :categories, CategoryType.to_list_type do
    resolve -> (obj, args, ctx) {
      Category.all
    }
  end

  field :action_items, ActionItemType.to_list_type do
    argument :category_name, types.String
    resolve -> (obj, args, ctx) {
      cat = args["category_name"]
      cat ? ActionItem.by_category(cat) : ActionItem.all
    }
  end

  field :current_user, UserType do
    resolve -> (obj, args, ctx) {
      ctx[:current_user]
    }
  end

end
