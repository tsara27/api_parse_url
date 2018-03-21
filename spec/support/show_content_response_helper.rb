module ShowContentServiceResponseHelper
  def raw_contents_success_response
    '{
      "data": [
        {
          "id": "13",
          "type": "contents",
          "links": {
            "self": "/contents/13"
          },
          "attributes": {
            "tag": "h1",
            "content": "Facade Pattern on Rails"
          },
          "relationships": {
            "content-url": {
              "links": {
                "self": "/contents/13/relationships/content-url",
                "related": "/contents/13/content-url"
              }
            }
          }
        },
        {
          "id": "14",
          "type": "contents",
          "links": {
            "self": "/contents/14"
          },
          "attributes": {
            "tag": "h2",
            "content": "For fun and profit"
          },
          "relationships": {
            "content-url": {
              "links": {
                "self": "/contents/14/relationships/content-url",
                "related": "/contents/14/content-url"
              }
            }
          }
        },
        {
          "id": "15",
          "type": "contents",
          "links": {
            "self": "/contents/15"
          },
          "attributes": {
            "tag": "h3",
            "content": "Ruslan Yakhyaev"
          },
          "relationships": {
            "content-url": {
              "links": {
                "self": "/contents/15/relationships/content-url",
                "related": "/contents/15/content-url"
              }
            }
          }
        }
      ]
    }'
  end
end

RSpec.configure do |config|
  config.include ShowContentServiceResponseHelper
end
