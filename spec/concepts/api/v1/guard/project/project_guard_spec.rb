RSpec.describe Api::V1::Guard::Project::ProjectGuard do
  describe '.call' do
    let(:user) { create(:user) }

    context 'when project is owned by user' do
      let(:model) { create(:project, user: user) }

      it 'returns true' do
        expect(described_class.call({}, current_user: user, model: model)).to eq true
      end
    end

    context 'when project is not owned by user' do
      let(:model) { create(:project) }

      it 'returns false' do
        expect(described_class.call({}, current_user: user, model: model)).to eq false
      end
    end
  end
end
