class LanguageSerializer < ActiveModel::Serializer
  attributes :id, :language, :is_currently_learning

  def is_currently_learning
    Userlang.exists?(user_id: @current_user, language_id: object.id, learning: true)
  end
  
end
