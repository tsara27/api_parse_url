require 'rails_helper'

RSpec.describe CreateContentFacade do
  describe '#contents' do
    context 'When successfully executed' do
      before(:each) do
        content_url = create(:content_url)
        content = create(:content, content_url_id: content_url.id)

        @index_content_facade = IndexContentFacade.new
        @result = @index_content_facade.contents
      end

      it 'returns true' do
        expect(@result).to be_truthy
      end

      it 'returns json serialize contents' do
        expect(@index_content_facade.body).not_to be_empty
      end

      it 'render json contents' do
        expect(@index_content_facade.status).to eq(200)
      end
    end
  end
end
