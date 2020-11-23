RSpec.describe Api::V1::Guard::Task::TaskGuard do
  describe '.call' do
    let(:user) { create(:user) }

    context 'when task is owned by user' do
      let(:model) { create(:task, project: create(:project, user: user)) }

      it 'returns true' do
        expect(described_class.call({}, current_user: user, model: model)).to eq true
      end
    end

    context 'when task is not owned by user' do
      let(:model) { create(:task) }

      it 'returns false' do
        expect(described_class.call({}, current_user: user, model: model)).to eq false
      end
    end
  end
end
