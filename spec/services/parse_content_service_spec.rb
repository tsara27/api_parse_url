require 'rails_helper'

RSpec.describe ParseContentService, type: :service do
  describe '#execute' do
    context 'When successfully executed' do
      before(:each) do
        params = ActionController::Parameters.new(content_url: { url: 'https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1' })

        @service = ParseContentService.new(permitted_params(params))
        @result = @service.execute
      end

      it 'returns success response' do
        expect(@result).to be_truthy
      end
    end

    def permitted_params(params)
      params.require(:content_url).permit(:url)
    end
  end
end
