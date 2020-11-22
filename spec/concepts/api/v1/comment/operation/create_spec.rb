RSpec.describe Api::V1::Comment::Operation::Create do
  describe '#call' do
    let(:user) { create(:user) }
    let(:task) { create(:task, project: create(:project, user: user)) }

    context 'when params valid' do
      let(:comment_params) { attributes_for(:comment).merge(task_id: task.id) }

      it 'success' do
        expect(described_class.call(params: comment_params, current_user: user)).to be_success
      end

      it 'creates new comment' do
        expect { described_class.call(params: comment_params, current_user: user) }.to change(Comment, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:comment_params) { { body: '', task_id: task.id } }

      it 'fails with name error' do
        expect(described_class.call(params: comment_params, current_user: user)).to be_failure
      end
    end

    context 'when user does not own task' do
      let(:comment_params) { { task_id: create(:task).id } }

      it 'returns policy error' do
        expect(described_class.call(params: comment_params, current_user: user)['result.policy.default']).to be_failure
      end
    end
  end
end
