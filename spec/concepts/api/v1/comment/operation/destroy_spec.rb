RSpec.describe Api::V1::Comment::Operation::Destroy do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:request) { test_request(user_params: user_params) }

    context 'when params valid' do
      let!(:comment) { create(:comment, task: create(:task, project: create(:project, user: user))) }
      let(:comment_params) { { id: comment.id } }

      it 'success' do
        expect(described_class.call(params: comment_params, request: request)).to be_success
      end

      it 'destroys comment' do
        expect { described_class.call(params: comment_params, request: request) }.to change(Comment, :count).by(-1)
      end
    end

    context 'when project does not exist' do
      let(:comment_params) { { id: -1 } }

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
