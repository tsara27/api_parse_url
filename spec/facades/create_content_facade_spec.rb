require 'rails_helper'

RSpec.describe CreateContentFacade do
  describe '#save_content' do
    context 'When successfully executed' do
      before(:each) do
        params = ActionController::Parameters.new(content_url: { url: 'https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1' })
        content_url_facade = CreateContentFacade.new(params)
        @result = content_url_facade.save_content
      end

      it 'returns true' do
        expect(@result).to be_truthy
      end

      it 'save content url' do
        expect(ContentUrl.last.url).to eq('https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1')
      end
    end
  end
end
