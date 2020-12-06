RSpec.describe Api::V1::Guard::Comment::CommentGuard do
  describe '.call' do
    let(:user) { create(:user) }

    context 'when comment is owned by user' do
      let(:model) { create(:comment, task: create(:task, project: create(:project, user: user))) }

      it 'returns true' do
        expect(described_class.call({}, current_user: user, model: model)).to eq true
      end
    end

    context 'when comment is not owned by user' do
      let(:model) { create(:comment) }

      it 'returns false' do
        expect(described_class.call({}, current_user: user, model: model)).to eq false
      end
    end
  end
end
