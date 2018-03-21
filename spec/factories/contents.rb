FactoryBot.define do
  factory :content do
    tag 'h1'
    content 'Lorem ipsum dolor sit amet'
    association :content_url
  end
end
