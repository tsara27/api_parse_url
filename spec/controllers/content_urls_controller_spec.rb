require 'rails_helper'

RSpec.describe ContentUrlsController, type: :controller do
  describe 'POST #create' do
    context 'When creates content successfully' do
      before(:each) do
        create(:content_url)

        params = { content_url: { url: 'https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1' } }

        create_content = CreateContentFacade.new(content_url_params(params))
        create_content.save_content

        post :create, params: params
      end

      it 'creates content url' do
        expect(ContentUrl.last.url).to eq('https://medium.com/@ryakh/facade-pattern-on-rails-d65b86cdb5b1')
      end

      it 'returns 201' do
        expect(response.status).to eq(201)
      end
    end

    context 'When url empty and failed to create content' do
      before(:each) do
        create(:content_url)

        params = { content_url: { url: '' } }

        post :create, params: params
      end

      it 'return 400' do
        expect(response.status).to eq(400)
      end
    end

    def content_url_params(params)
      ActionController::Parameters.new(params)
    end
  end

  describe 'GET #index' do
    context 'Get all serialized contents' do
      before(:each) do
        content_url = create(:content_url)
        content = create(:content, content_url_id: content_url.id)

        contents = ContentUrl.all

        @index_content_facade = IndexContentFacade.new
        @index_content_facade.contents

        get :index
      end

      it 'returns all serialized contents' do
        expect(@index_content_facade.body).not_to be_empty
      end

      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #show' do
    context 'When content url exists' do
      before(:each) do
        content_url = create(:content_url)
        content = create(:content, content_url_id: content_url.id)

        params = { id: content_url.id }

        @show_content_facade = ShowContentFacade.new(params)
        @show_content_facade.show_content

        get :index, params: params
      end

      it 'returns all serialized contents' do
        expect(@show_content_facade.body).not_to be_empty
      end

      it 'returns 200' do
        expect(response.status).to eq(200)
      end
    end

    context "When content url doesn't exists" do
      before(:each) do
        params = { id: 1 }

        @show_content_facade = ShowContentFacade.new(params)
        @show_content_facade.show_content

        get :index, params: params
      end

      it 'returns all serialized contents' do
        expected_response = { error: 'Id could not be found.' }
        expect(@show_content_facade.body).to eq(expected_response)
      end

      it 'returns 404' do
        expect(@show_content_facade.status).to eq(404)
      end
    end
  end
end
