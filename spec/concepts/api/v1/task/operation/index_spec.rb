RSpec.describe Api::V1::Task::Operation::Index do
  describe '#call' do
    let(:user) { create(:user) }
    let(:project) { create(:project, user: user, tasks: create_list(:task, 3)) }

    context 'when params is valid' do
      let(:task_params) { { project_id: project.id } }

      it 'success' do
        expect(described_class.call(params: task_params, current_user: user)).to be_success
      end
    end

    context 'when user does not own project' do
      let(:task_params) { { project_id: create(:project).id } }

      it 'returns policy error' do
        expect(described_class.call(params: task_params, current_user: user)['result.policy.default']).to be_failure
      end
    end

    context 'when project does not exist' do
      let(:task_params) { { project_id: -1 } }

      it 'returns model error' do
        expect(described_class.call(params: task_params, current_user: user)['result.model']).to be_failure
      end
    end
  end
end
