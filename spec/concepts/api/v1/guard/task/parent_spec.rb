RSpec.describe Api::V1::Guard::Task::Parent do
  describe '.call' do
    let(:user) { create(:user) }

    context 'when task id is valid' do
      let(:params) { { task_id: create(:task, project: create(:project, user: user)).id } }

      it 'returns true' do
        expect(described_class.call({}, current_user: user, params: params)).to eq true
      end
    end

    context 'when task id is invalid' do
      let(:params) { { task_id: -1 } }

      it 'returns false' do
        expect(described_class.call({}, current_user: user, params: params)).to eq false
      end
    end
  end
end
