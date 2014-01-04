class User < Ohm::Model
  attribute :username
  attribute :email

  unique :email
end
