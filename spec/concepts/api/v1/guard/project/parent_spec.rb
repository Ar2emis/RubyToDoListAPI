RSpec.describe Api::V1::Guard::Project::Parent do
  describe '.call' do
    let(:user) { create(:user) }

    context 'when project id is valid' do
      let(:params) { { project_id: create(:project, user: user).id } }

      it 'returns true' do
        expect(described_class.call({}, current_user: user, params: params)).to eq true
      end
    end

    context 'when project id is invalid' do
      let(:params) { { project_id: -1 } }

      it 'returns false' do
        expect(described_class.call({}, current_user: user, params: params)).to eq false
      end
    end
  end
end
