class CreateContentFacade
  attr_reader :params, :status, :body

  def initialize(params)
    @params = params
  end

  def save_content
    return failed_save_url if parse_html_and_save_url.nil?
    save_parsed_html_content
  end

  private

  def parse_content_service
    @parse_content_service ||= ParseContentService.new(content_url_params)
  end

  def save_content_service
    @save_content_service ||= SaveContentService.new(content_url_params,
                                                     parsed_contents)
  end

  def show_content_service
    @show_content_service = SerializeContentService.new(content_url_params)
  end

  def parsed_contents
    parse_content_service.parsed_contents
  end

  def parse_html_and_save_url
    parse_content_service.execute
  end

  def json_api_serializer
    show_content_service.execute
  end

  def save_parsed_html_content
    return unless save_content_service.execute
    @body = json_api_serializer
    @status = 201
  end

  def failed_save_url
    @body = { error: 'Failed to save content' }
    @status = 400
  end

  def content_url_params
    params.require(:content_url).permit(:url)
  end
end
