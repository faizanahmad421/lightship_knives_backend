class Users::PasswordsController < Devise::PasswordsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if successfully_sent?(resource)
      render json: { message: 'Password reset instructions sent.' }, status: :ok
    else
      render json: { message: 'Password reset failed.', errors: resource.errors }, status: :unprocessable_entity
    end
  end
end
