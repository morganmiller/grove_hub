LoginMutation = GraphQL::Relay::Mutation.define do
  name "LoginMutation"

  input_field :email, !types.String
  input_field :password, !types.String

  return_field :user, UserType

  resolve ->(obj, args, ctx) {
    user = User.find_by(email: args["email"])
    if user && user.valid_password?(args["password"])
      return {user: user}
    end
  }
end
