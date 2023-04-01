class FlashcardSetSerializer < ActiveModel::Serializer
  attributes :id, :completed, :type, :title
  has_one :language
end
