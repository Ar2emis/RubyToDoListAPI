RSpec.describe Api::V1::Project::Operation::Show do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }

    context 'when user have passed project' do
      let(:project) { create(:project, user: user) }
      let(:project_params) { { id: project.id } }

      it 'success' do
        expect(described_class.call(params: project_params, request: request)).to be_success
      end
    end

    context 'when project does not exist' do
      let(:project_params) { { id: -1 } }

      it 'returns model error' do
        expect(described_class.call(params: project_params, request: request)['result.policy.existance']).to be_failure
      end
    end

    context 'when policy is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
