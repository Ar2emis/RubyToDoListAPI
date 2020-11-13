RSpec.describe Api::V1::Comment::Operation::Create do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }

    context 'when params valid' do
      let(:task) { create(:task, project: create(:project, user: user)) }
      let(:comment_params) { { task_id: task.id, data: { body: attributes_for(:comment)[:body] } } }

      it 'success' do
        expect(described_class.call(params: comment_params, request: request)).to be_success
      end

      it 'creates new comment' do
        expect { described_class.call(params: comment_params, request: request) }.to change(Comment, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:comment_params) { { data: { body: '' } } }

      it 'fails with name error' do
        expect(described_class.call(params: comment_params, request: request)).to be_failure
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
