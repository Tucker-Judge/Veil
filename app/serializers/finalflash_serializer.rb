class FinalflashSerializer < ActiveModel::Serializer
  attributes :title
  has_one :flashcard
end
