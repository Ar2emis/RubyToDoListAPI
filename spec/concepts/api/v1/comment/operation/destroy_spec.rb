RSpec.describe Api::V1::Comment::Operation::Destroy do
  describe '#call' do
    let!(:user) { create(:user) }
    let!(:comment) { create(:comment, task: create(:task, project: create(:project, user: user))) }

    context 'when params valid' do
      let(:comment_params) { { id: comment.id } }

      it 'success' do
        expect(described_class.call(params: comment_params, current_user: user)).to be_success
      end

      it 'destroys comment' do
        expect { described_class.call(params: comment_params, current_user: user) }.to change(Comment, :count).by(-1)
      end
    end

    context 'when user does not own comment' do
      let(:comment_params) { { id: create(:comment).id } }

      it 'returns policy error' do
        expect(described_class.call(params: comment_params, current_user: user)['result.policy.default']).to be_failure
      end
    end

    context 'when comment does not exist' do
      let(:comment_params) { { id: -1 } }

      it 'returns model error' do
        expect(described_class.call(params: comment_params, current_user: user)['result.model']).to be_failure
      end
    end
  end
end
