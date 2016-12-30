class ApplicationController < ActionController::API
  include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound do
    render json: { error: 'No such record in Database; check params',
                   status: :not_found,
    }
  end
end
