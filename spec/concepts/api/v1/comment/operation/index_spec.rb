RSpec.describe Api::V1::Comment::Operation::Index do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }

    context 'when params is valid' do
      let(:task) { create(:task, project: create(:project, user: user), comments: create_list(:comment, 3)) }
      let(:comment_params) { { task_id: task.id } }

      it 'success' do
        expect(described_class.call(params: comment_params, request: request)).to be_success
      end
    end

    context 'when task does not exist' do
      let(:comment_params) { { task_id: -1 } }

      it 'returns existance policy error' do
        expect(described_class.call(params: comment_params, request: request)['result.policy.existance']).to be_failure
      end
    end

    context 'when policy is invalid' do
      it 'returns policy error' do
        expect(described_class.call(params: {}, request: test_request)['result.policy.default']).to be_failure
      end
    end
  end
end
