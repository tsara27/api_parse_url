## Table of content

- [Technologies](#technologies)
- [Requirements](#requirements)
- [Local Setup](#local-setup)
- [Endpoints](#endpoints)

## Technologies

- Ruby 2.5.0
- Ruby on Rails 5.1.5
- Postgresql
- Test: RSpec
- Gems
  - factory_bot_rails
  - fastjson_api
  - nokogiri
  - pry
  - shoulda_matchers

## Requirements

These should be installed before you get started:
- Ruby version 2.5.0
- Bundler
- Git

## Local Setup

1. Run `bundle install`
2. Run `rake db:setup db:test:prepare` to setup database.
3. Run `rake db:schema:load` to setup tables on the database.
4. Run `rails s` to run Rails server in development.

## Endpoints

1. Receive the URL and store content [POST]
  - Parameters

  ```
  content_url: { url: 'http://example.com' }
  ```

  - Response 201

  ```json
    {
      "data": [
        {
          "id": "784",
          "type": "content",
          "attributes": {
            "tag": "h1",
            "content": "Example Domain",
            "created_at": "2018-03-21T02:54:22.461Z",
            "updated_at": "2018-03-21T02:54:22.461Z"
          },
          "relationships": {
            "content_url": {
              "data": {
                "id": "100",
                "type": "content_url"
              }
            }
          }
        }
      ]
    }
  ```

  - Response 400
  
  ```json
    {
      "error": "Failed to save content"
    }
  ```

2. Get all contents [GET]
  - Response 200

  ```json
    {
      "data": [
        {
          "id": "149",
          "type": "content_url",
          "attributes": {
            "url": "http://example.com",
            "created_at": "2018-03-21T03:24:58.873Z",
            "updated_at": "2018-03-21T03:24:58.873Z",
            "contents": [
              {
                "id": 785,
                "tag": "h1",
                "content": "Example Domain",
                "content_url_id": 149,
                "created_at": "2018-03-21T03:24:58.952Z",
                "updated_at": "2018-03-21T03:24:58.952Z"
              }
            ]
          },
          "relationships": {
            "contents": {
              "data": [
                {
                  "id": "785",
                  "type": "content"
                }
              ]
            }
          }
        },
        {
          "id": "150",
          "type": "content_url",
          "attributes": {
            "url": "http://a.com",
            "created_at": "2018-03-21T03:25:15.490Z",
            "updated_at": "2018-03-21T03:25:15.490Z",
            "contents": []
          },
          "relationships": {
            "contents": {
              "data": []
            }
          }
        }
      ]
    }
  ```

3. Get contents by content url id [GET]
  - Parameters

  ```
  { id: 149 }
  ```

  - Response 200

  ```json
  {
    "data": {
      "id": "149",
      "type": "content_url",
      "attributes": {
        "url": "http://example.com",
        "created_at": "2018-03-21T03:24:58.873Z",
        "updated_at": "2018-03-21T03:24:58.873Z",
        "contents": [
          {
            "id": 785,
            "tag": "h1",
            "content": "Example Domain",
            "content_url_id": 149,
            "created_at": "2018-03-21T03:24:58.952Z",
            "updated_at": "2018-03-21T03:24:58.952Z"
          }
        ]
      },
      "relationships": {
        "contents": {
          "data": [
            {
              "id": "785",
              "type": "content"
            }
          ]
        }
      }
    }
  }
  ```

  - Response 404

  ```json
    {
      "error": "Id could not be found"
    }
  ```