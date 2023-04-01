class UserlangSerializer < ActiveModel::Serializer
  attributes :id
  has_one :user
  has_one :language
end
