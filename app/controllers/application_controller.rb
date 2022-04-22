class ApplicationController < ActionController::API
    # include ActionController::Serialization
    include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :no_route
    rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

    # wrap_parameters format: [] related to strong params and its ability to build a nested object in params

    private

    def invalid_record(invalid)
        render json: {error: invalid.record.errors.full_messages.to_sentence}, status: :unprocessable_entity
    end

    def no_route
        render json: {error: "Couldn't find a resource with id #{params[:id]}"}.to_json
    end

end
