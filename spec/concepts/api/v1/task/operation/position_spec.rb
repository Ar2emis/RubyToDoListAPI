RSpec.describe Api::V1::Task::Operation::Position do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }
    let(:task) { create(:task, project: create(:project, user: user, tasks: create_list(:task, 3))) }

    context 'when params valid' do
      let(:task_params) { { task_id: task.id, data: { position: described_class::DOWN } } }

      it 'success' do
        expect(described_class.call(params: task_params, request: request)).to be_success
      end
    end

    context 'when params is invalid' do
      let(:task_params) { { task_id: task.id, data: { position: -1 } } }

      it 'fails with position error' do
        expect(described_class.call(params: task_params, request: request)).to be_failure
      end
    end

    context 'when task does not exist' do
      let(:task_params) { { task_id: -1 } }

      it 'returns existance policy error' do
        expect(described_class.call(params: task_params, request: request)['result.policy.existance']).to be_failure
      end
    end

    context 'when policy is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
