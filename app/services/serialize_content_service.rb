class SerializeContentService
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def execute
    json_resources(contents)
  end

  private

  def contents
    set_content_url.nil?
    Content.where(content_url_id: set_content_url.id)
  end

  def json_resources(records)
    ContentSerializer.new(records).serialized_json
  end

  def set_content_url
    ContentUrl.find_by(url: params[:url])
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
