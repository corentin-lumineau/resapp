class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordInvalid, with: :handle_error
    rescue_from ActionController::ParameterMissing, with: :handle_error
    rescue_from ActiveRecord::RecordNotFound, with: :handle_error

    private

    def handle_error(exception)
        redirect_to root_path, alert: exception.message
    end
end