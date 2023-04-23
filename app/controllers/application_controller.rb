
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :set_locale
        
  protected
      
  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
      
  def render_not_found(exception)
    render json: { error: "#{exception} not found"}, status: :not_found
  end

  def set_locale
    I18n.locale = @current_user.lang_code[0,2] || I18n.default_locale
  end

  def extract_locale_from_params
    locale = params[:locale]
    locale.present? && I18n.available_locales.include?(locale.to_sym) ? locale.to_sym : nil
  end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lang_code])
  end
end