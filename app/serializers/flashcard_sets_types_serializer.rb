class FlashcardSetsTypesSerializer < ActiveModel::Serializer
  attributes :id, :card_type, :completed
end
