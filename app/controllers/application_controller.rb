class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    rescue_from ActionController::ParameterMissing, with: :handle_param_is_missing
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    private

    def handle_record_not_found(exception)
        redirect_to root_path, alert: "Sorry, we can't find out what you are looking for"
    end

    def handle_param_is_missing(exception)
        redirect_to root_path, alert: "Please, fill out the form correctly"
    end

    def handle_record_invalid(exception)
        redirect_to root_path, alert: exception.message
    end
end