class IndexContentFacade
  attr_reader :status, :body

  def contents
    parse_serialized_contents
  end

  private

  def set_contents
    ContentUrl.all
  end

  def json_api_serializer(records)
    ContentUrlSerializer.new(records).serialized_json
  end

  def parse_serialized_contents
    @body = json_api_serializer(set_contents)
    @status = 200
  end
end
