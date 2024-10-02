class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success(resource) && return if resource.persisted?

    register_failed
  end

  def register_success(resource)
    render json: { message: 'Signed up successfully', user: resource, token: current_token }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong' }, status: :unprocessable_entity
  end
end
