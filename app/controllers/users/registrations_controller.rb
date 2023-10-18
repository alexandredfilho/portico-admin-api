# frozen_string_literal: true

#
# Users module
#
module Users
  #
  # This controller is responsible to create new users
  #
  class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    private

    def respond_with(resource, _options = {})
      if resource.persisted?
        user_successfully_created
      else
        failed_to_create_user
      end
    end

    def user_successfully_created
      render json: {
               status: {
                 code: 200,
                 message: 'Signed up successfully',
                 data: resource
               }
             },
             status: :ok
    end

    def failed_to_create_user
      render json: {
               status: {
                 message: 'User could not be created successfully',
                 errors: resource.errors.full_messages
               }
             },
             status: :unprocessable_entity
    end
  end
end
