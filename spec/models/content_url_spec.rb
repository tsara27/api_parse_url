require 'rails_helper'

RSpec.describe ContentUrl, type: :model do
  it { should have_many(:contents) }
end
