require 'spec_helper'

if Rails.env.production?
  abort('The Rails environment is running in production mode!')
end

require 'support/factory_bot'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.filter_rails_from_backtrace!

  config.before(:each, type: :system) do
    driven_by :rack_test
  end
end
