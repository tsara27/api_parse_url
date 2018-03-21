class ContentUrlSerializer
  include FastJsonapi::ObjectSerializer
  set_type :content_url
  attributes :url, :created_at, :updated_at, :contents
  has_many :contents
end
