class ApplicationController < ActionController::API
  include ActionController::Cookies
  
  rescue_from ActiveRecord::RecordInvalid, with: :render_error_response

  before_action :authorize

  private

  def authorize
    return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
  end

  def render_error_response(error_message)
    render json: { errors: error_message.record.errors.full_messages }, status: :unprocessable_entity
  end
end
