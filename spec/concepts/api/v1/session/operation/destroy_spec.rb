RSpec.describe Api::V1::Session::Operation::Destroy do
  describe '#call' do
    context 'when params is valid' do
      let(:user_params) do
        attributes = attributes_for(:user)
        create(:user, **attributes)
        attributes
      end
      let(:request) { test_request(user_params: user_params) }

      it 'success' do
        expect(described_class.call(params: {}, request: request)).to be_success
      end
    end

    context 'when params is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
