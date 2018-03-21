class SaveContentService
  attr_reader :params

  def initialize(params, parsed_contents)
    @params = params
    @parsed_contents = parsed_contents
  end

  def execute
    save_content
  end

  private

  def get_content(element)
    @parsed_contents.search(element).map(&:text)
  end

  def tags
    ['h1', 'h2', 'h3']
  end

  def set_content_url
    ContentUrl.find_by(url: params[:url])
  end

  def save_content
    tags.each do |t|
      get_content(t).each do |c|
        content = set_content_url.contents.build(tag: t, content: c)
        content.save
      end
    end
  end
end
