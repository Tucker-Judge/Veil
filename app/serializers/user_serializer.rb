class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :email, :password_digest, :lang_code
  has_many :languages
end
