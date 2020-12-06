RSpec.describe Api::V1::Project::Operation::Destroy do
  describe '#call' do
    let(:user) { create(:user) }

    context 'when project exists' do
      let!(:project) { create(:project, user: user) }
      let(:project_params) { { id: project.id } }

      it 'success' do
        expect(described_class.call(params: project_params, current_user: user)).to be_success
      end

      it 'destroys project' do
        expect { described_class.call(params: project_params, current_user: user) }.to change(Project, :count).by(-1)
      end
    end

    context 'when user does not own project' do
      let(:project_params) { { id: create(:project).id } }

      it 'returns policy error' do
        expect(described_class.call(params: project_params, current_user: user)['result.policy.default']).to be_failure
      end
    end

    context 'when project does not exist' do
      let(:project_params) { { id: -1 } }

      it 'returns model error' do
        expect(described_class.call(params: project_params, current_user: user)['result.model']).to be_failure
      end
    end
  end
end
