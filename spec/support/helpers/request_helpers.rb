module RequestHelpers
  def test_request(user_params: nil)
    request = instance_double('test_request')
    allow(request).to receive(:headers).and_return(user_params ? tokens_headers(user_params) : {})
    allow(request).to receive(:cookies).and_return({})
    allow(request).to receive(:method).and_return('GET')
    request
  end

  def tokens_headers(user_params)
    call(Session::Create, params: user_params, request: test_request)[:tokens]
  end
end

RSpec.configure do |config|
  config.include RequestHelpers
end
