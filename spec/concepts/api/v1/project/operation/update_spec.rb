RSpec.describe Api::V1::Project::Operation::Update do
  describe '#call' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user) }

    context 'when params valid' do
      let(:project_params) { attributes_for(:project).merge(id: project.id) }

      it 'success' do
        expect(described_class.call(params: project_params, current_user: user)).to be_success
      end
    end

    context 'when user does not own project' do
      let(:project_params) { { id: create(:project).id } }

      it 'returns policy error' do
        expect(described_class.call(params: project_params, current_user: user)['result.policy.default']).to be_failure
      end
    end

    context 'when params invalid' do
      let(:project_params) { { id: project.id, data: { name: '' } } }

      it 'fails with contract error' do
        expect(described_class.call(params: project_params, current_user: user)['result.contract.default'])
          .to be_failure
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
