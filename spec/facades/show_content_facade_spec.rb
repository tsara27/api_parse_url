require 'rails_helper'

RSpec.describe ShowContentFacade do
  describe '#show_contents' do
    context 'When successfully executed' do
      before(:each) do
        content_url = create(:content_url)
        content = create(:content, content_url_id: content_url.id)

        params = ActionController::Parameters.new(id: content_url.id)

        @show_content_facade = ShowContentFacade.new(params)
        @result = @show_content_facade.show_content
      end

      it 'returns true' do
        expect(@result).to be_truthy
      end

      it 'returns json serialize contents' do
        expect(@show_content_facade.body).not_to be_empty
      end

      it 'render json contents' do
        expect(@show_content_facade.status).to eq(200)
      end
    end

    context "When content url doesn't exists" do
      before(:each) do
        params = ActionController::Parameters.new(id: 1)

        @show_content_facade = ShowContentFacade.new(params)
        @result = @show_content_facade.show_content
      end

      it 'returns 404' do
        expect(@result).to eq(404)
      end
    end
  end
end
