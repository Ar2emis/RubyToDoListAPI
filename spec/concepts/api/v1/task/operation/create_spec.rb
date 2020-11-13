RSpec.describe Api::V1::Task::Operation::Create do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }
    let(:project) { create(:project, user: user) }

    context 'when params valid' do
      let(:task_params) { { project_id: project.id, data: { name: attributes_for(:task)[:name] } } }

      it 'success' do
        expect(described_class.call(params: task_params, request: request)).to be_success
      end

      it 'creates new task' do
        expect { described_class.call(params: task_params, request: request) }.to change(Task, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:task_params) { { data: { name: '' } } }

      it 'fails with name error' do
        expect(described_class.call(params: task_params, request: request)).to be_failure
      end
    end

    context 'when project does not exist' do
      let(:task_params) { { project_id: -1 } }

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
