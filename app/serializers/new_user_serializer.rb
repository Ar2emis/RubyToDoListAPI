class NewUserSerializer < BaseSerializer
  set_type :user
  attributes :username, :provider, :uid, :created_at, :updated_at
end
