require 'rails_helper'

RSpec.describe SerializeContentService, type: :service do
  describe '#execute' do
    context 'When successfully executed' do
      before(:each) do
        content_url = create(:content_url)
        content = create(:content, content_url_id: content_url.id)

        params = ActionController::Parameters.new(content_url: { url: 'https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1' })
        show_content_service = SerializeContentService.new(permitted_params(params))

        @result = show_content_service.execute
      end

      it 'returns success response' do
        expect(@result).not_to be_empty
      end
    end

    def permitted_params(params)
      params.require(:content_url).permit(:url)
    end
  end
end
