require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should belong_to(:content_url) }
end
