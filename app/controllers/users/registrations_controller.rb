class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success(resource) && return if resource.persisted?

    register_failed
  end

  def register_success(resource)
    render json: { message: 'Signed up successfully.', data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] }, token: current_token }, status: :ok
  end

  def register_failed
    render json: { message: current_user.errors.full_messages.to_sentence }, status: :unprocessable_entity
  end
end
