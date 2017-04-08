LoginMutation = GraphQL::Relay::Mutation.define do
  name "LoginMutation"
  return_type UserType

  input_field :email, !types.String
  input_field :password, !types.String
  # Expects args from client to be like so:
  #   input: {email: $email, password: $password}

  resolve ->(obj, args, ctx) {
    # TODO: use devise auth somehow
  }
end
