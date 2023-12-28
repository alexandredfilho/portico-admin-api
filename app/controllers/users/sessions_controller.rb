# frozen_string_literal: true

module Users
  #
  # This controller is responsible  for creating users sessions
  #
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(_resource, _options = {})
      render json: {
               status: {
                 code: 200,
                 message: 'User signed in successfully',
                 data: current_user
               }
             },
             status: :ok
    end

    def respond_to_on_destroy
      current_user = User.find(jwt_payload['sub'])

      if current_user
        user_session_successfully_registered
      else
        user_session_failed_to_register
      end
    end

    def jwt_payload
      JWT.decode(
        request.headers['Authorization'].split(' ')[1],
        Rails.application.secret_key_base
      ).first
    end

    def user_session_successfully_registered
      render json: {
               status: 200,
               message: 'Signed out successfully'
             },
             status: :ok
    end

    def user_session_failed_to_register
      render json: {
               status: 401,
               message: 'User has no active session'
             },
             status: :unauthorized
    end
  end
end
