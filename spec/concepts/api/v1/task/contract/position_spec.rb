RSpec.describe Api::V1::Task::Contract::Position do
  subject(:contract) { described_class.new(task) }

  let(:task) do
    task = create(:task)
    create_list(:task, 3, project: task.project)
    task
  end

  describe '#validate' do
    context 'when params is valid' do
      let(:task_params) { { position: 'down' } }

      it 'returns true' do
        expect(contract.validate(task_params)).to eq true
      end
    end

    context 'when params is invalid' do
      let(:position_params) { { position: FFaker::Music.song } }

      it 'returns false' do
        expect(contract.validate(position_params)).to eq false
      end
    end

    context 'when position is empty' do
      let(:position_params) { { position: '' } }

      it 'contains position error' do
        contract.validate(position_params)
        expect(contract.errors[:position]).not_to be_empty
      end
    end
  end
end
