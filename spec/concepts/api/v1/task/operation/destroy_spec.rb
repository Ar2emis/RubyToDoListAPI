RSpec.describe Api::V1::Task::Operation::Destroy do
  describe '#call' do
    let(:user) { create(:user) }
    let(:task) { create(:task, project: create(:project, user: user)) }

    context 'when task exists' do
      let(:task_params) { { id: task.id } }

      it 'success' do
        expect(described_class.call(params: task_params, current_user: user)).to be_success
      end
    end

    context 'when user does not own task' do
      let(:task_params) { { id: create(:task).id } }

      it 'returns policy error' do
        expect(described_class.call(params: task_params, current_user: user)['result.policy.default']).to be_failure
      end
    end

    context 'when task does not exist' do
      let(:task_params) { { id: -1 } }

      it 'returns model error' do
        expect(described_class.call(params: task_params, current_user: user)['result.model']).to be_failure
      end
    end
  end
end
