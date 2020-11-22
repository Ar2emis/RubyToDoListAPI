RSpec.describe Api::V1::Task::Operation::Create do
  describe '#call' do
    let!(:user) { create(:user) }
    let(:project) { create(:project, user: user) }

    context 'when params valid' do
      let(:task_params) { attributes_for(:task).merge(project_id: project.id) }

      it 'success' do
        expect(described_class.call(params: task_params, current_user: user)).to be_success
      end

      it 'creates new task' do
        expect { described_class.call(params: task_params, current_user: user) }.to change(Task, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:task_params) { { project_id: project.id, name: '' } }

      it 'fails with name error' do
        expect(described_class.call(params: task_params, current_user: user)).to be_failure
      end
    end

    context 'when project does not exist' do
      let(:task_params) { { project_id: -1 } }

      it 'returns policy error' do
        expect(described_class.call(params: task_params, current_user: user)['result.policy.default']).to be_failure
      end
    end
  end
end
