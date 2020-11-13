RSpec.describe Api::V1::Project::Operation::Index do
  describe '#call' do
    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, projects: create_list(:project, 3), **attributes)
      attributes
    end
    let(:request) { test_request(user_params: user_params) }

    context 'when valid params' do
      it 'success' do
        expect(described_class.call(params: {}, request: request)).to be_success
      end
    end

    context 'when policy is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
