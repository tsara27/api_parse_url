class ContentSerializer
  include FastJsonapi::ObjectSerializer
  set_type :content
  attributes :tag, :content, :created_at, :updated_at
  belongs_to :content_url
end
