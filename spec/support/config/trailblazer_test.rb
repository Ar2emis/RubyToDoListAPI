RSpec.configure do |config|
  config.include Trailblazer::Test::Operation::Helper
  config.include Trailblazer::Test::Assertions
  config.include Trailblazer::Test::Operation::Assertions
  config.include Trailblazer::Test::Operation::PolicyAssertions
end
