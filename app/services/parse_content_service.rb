require 'open-uri'

class ParseContentService
  attr_reader :params, :parsed_contents

  def initialize(params)
    @params = params
  end

  def execute
    save_content_url
    @parsed_contents = parse_url if success?
  end

  private

  def save_content_url
    ContentUrl.create(url: params[:url])
  end

  def parse_url
    Nokogiri::HTML(open(params[:url]))
  rescue StandardError
    nil
  end

  def success?
    !parse_url.nil?
  end
end
