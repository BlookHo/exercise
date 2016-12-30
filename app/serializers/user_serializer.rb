class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :group_events
end
