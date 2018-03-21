require 'rails_helper'

RSpec.describe SaveContentService, type: :service do
  describe '#execute' do
    context 'When successfully executed' do
      before(:each) do
        params = ActionController::Parameters.new(content_url: { url: 'https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1' })

        parse_content_service = ParseContentService.new(permitted_params(params))
        parsed_contents = parse_content_service.execute

        save_content_service = SaveContentService.new(permitted_params(params),
                                                      parsed_contents)
        @result = save_content_service.execute
      end

      it 'returns success response' do
        expect(@result).to be_truthy
      end

      it 'found h1, h2, h3 tag' do
        expect(ContentUrl.last.contents.where(tag: 'h1')).not_to be_empty
        expect(ContentUrl.last.contents.where(tag: 'h2')).not_to be_empty
        expect(ContentUrl.last.contents.where(tag: 'h3')).not_to be_empty
      end
    end

    context 'When failed to execute' do
      before(:each) do
        params = ActionController::Parameters.new(content_url: { url: 'https://cdn-images-1.medium.com/max/2000/1*V0F0-8AH8oV1LUSCbQsX4w.png' })

        parse_content_service = ParseContentService.new(permitted_params(params))
        parsed_contents = parse_content_service.execute

        save_content_service = SaveContentService.new(permitted_params(params),
                                                      parsed_contents)
        @result = save_content_service.execute
      end

      it 'found h1, h2, h3 tag' do
        expect(ContentUrl.last.contents.where(tag: 'h1')).to be_empty
        expect(ContentUrl.last.contents.where(tag: 'h2')).to be_empty
        expect(ContentUrl.last.contents.where(tag: 'h3')).to be_empty
      end
    end

    def permitted_params(params)
      params.require(:content_url).permit(:url)
    end
  end
end
