class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :no_route

    private

    def no_route
        render json: {error: "Couldn't find a resource with id #{params[:id]}"}
    end

end
