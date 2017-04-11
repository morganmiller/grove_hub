LoginMutation = GraphQL::Relay::Mutation.define do
  name "LoginMutation"

  input_field :email, !types.String
  input_field :password, !types.String

  return_field :user, UserType

  resolve ->(obj, args, ctx) {
    user = User.find_by(email: args["email"])
    if user && user.valid_password?(args["password"])
      return {user: user}
      # Needs some sort of auth middleware helpers to create sessions through graphql,
      # and a way to selectively bypass user authentication for singular graphql endpoint.
      # (can't be before_action, needs to be cooked into middleware).
      # Devise may not be best option.
    end
  }
end
