RSpec.describe Api::V1::Project::Operation::Destroy do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }

    context 'when project exists' do
      let!(:project) { create(:project, user: user) }
      let(:project_params) { { id: project.id } }

      it 'success' do
        expect(described_class.call(params: project_params, request: request)).to be_success
      end

      it 'destroys project' do
        expect { described_class.call(params: project_params, request: request) }.to change(Project, :count).by(-1)
      end
    end

    context 'when project does not exists' do
      let(:project_params) { { id: -1 } }

      it 'returns existance policy error' do
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
