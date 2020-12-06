require 'dox'

Dox.configure do |config|
  config.headers_whitelist = %w[Accept Authorization X-Refresh-Token]
end

RSpec.configure do |config|
  config.after(:each, :dox) do |example|
    example.metadata[:request] = request
    example.metadata[:response] = response
  end
end
