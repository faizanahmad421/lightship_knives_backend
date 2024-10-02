class Users::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: { message: 'Logged in successfully', token: current_token, data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes] } }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      request.headers['Authorization'] = ''
      render json: { message: 'Logged out successfully.' }, status: :ok
    else
      render json: { message: "Couldn't find an active session." }, status: :unauthorized
    end
  end
end
