RSpec.describe Api::V1::Guard::CommentExists do
  subject(:guard) { described_class.new }

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, user_params) }
  let!(:comment) { create(:comment, task: create(:task, project: create(:project, user: user))) }
  let(:ctx) { {} }

  context 'with id' do
    context 'when id is valid' do
      let(:params) { { id: comment.id } }

      it 'returns true' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq true
      end
    end

    context 'when id is invalid' do
      let(:params) { { id: comment.id.pred } }

      it 'returns false' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq false
      end
    end
  end
end
