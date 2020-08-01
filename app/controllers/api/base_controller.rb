# frozen_string_literal: true

class Api::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from StandardError, with: :standard_error

  def standard_error(exception)
    data = { message: exception.message }
    response_struct(data: data, http_status: 400)
  end


  def render_success(data: nil, serializer: nil, message: 'Data was fetched successfully', serializer_params: nil, status: 200, http_status: :ok)
    data_response = data
    if serializer.present?
      data_response = serializer.new(data, serializer_params: serializer_params).to_h
    end
    response_struct(data: data_response, message: message, status: status, http_status: http_status)
  end

  def render_error(message:, status: :unprocessable_entity, http_status: :unprocessable_entity)
    response_struct(message: message, status: status, http_status: http_status)
  end

  def not_found(resource: nil)
    messages = "#{(resource || 'Resource')} not found"
    response_struct(message: messages, status: 404, http_status: :not_found)
  end

  def render_list(list:, serializer: nil, message: 'Data was fetched successfully', serializer_params: nil)
    data_response = ActiveModelSerializers::SerializableResource.new(list,
                                                                     each_serializer: serializer,
                                                                     serializer_params: serializer_params)
    response_struct(data: data_response, message: message)
  end


  private

  def response_struct(data: nil, message: 'Successfully', status: 200, http_status: :ok, error_id: nil)
    render json: data.to_json, status: http_status
  end
end
