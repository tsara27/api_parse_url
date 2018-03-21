class ContentUrlsController < ApplicationController
  def create
    render_json(create_content_facade) if create_content_facade.save_content
  end

  def index
    render_json(index_content_facade) if index_content_facade.contents
  end

  def show
    render_json(show_content_facade) if show_content_facade.show_content
  end

  private

  def index_content_facade
    @facade ||= IndexContentFacade.new
  end

  def show_content_facade
    @facade ||= ShowContentFacade.new(params)
  end

  def create_content_facade
    @facade ||= CreateContentFacade.new(params)
  end

  def render_json(facade)
    render json: facade.body, status: facade.status
  end
end
