RSpec.describe Api::V1::Project::Operation::Create do
  describe '#call' do
    let(:project_params) { { data: attributes_for(:project) } }
    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end
    let(:request) { test_request(user_params: user_params) }

    context 'when params valid' do
      it 'success' do
        expect(described_class.call(params: project_params, request: request)).to be_success
      end

      it 'creates project' do
        expect { described_class.call(params: project_params, request: request) }.to change(Project, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:project_params) { { data: attributes_for(:project, name: '') } }

      it 'fails with contract error' do
        expect(described_class.call(params: project_params, request: request)['result.contract.default']).to be_failure
      end
    end

    context 'when policy is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
