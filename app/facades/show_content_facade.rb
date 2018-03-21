class ShowContentFacade
  attr_reader :params, :status, :body

  def initialize(params)
    @params = params
  end

  def show_content
    return error_response if set_contents.nil?
    parse_serialized_contents
  end

  private

  def set_contents
    ContentUrl.find(params[:id])
  rescue StandardError
    nil
  end

  def json_api_serializer(records)
    ContentUrlSerializer.new(records).serialized_json
  end

  def parse_serialized_contents
    @body = json_api_serializer(set_contents)
    @status = 200
  end

  def error_response
    @body = { error: 'Id could not be found.' }
    @status = 404
  end
end
