class FlashcardSerializer < ActiveModel::Serializer
  attributes :id, :front, :one_back
  has_one :flashcard_set
  
  def one_back
     object.back[instance_options[:lang_code]]
  end
end
