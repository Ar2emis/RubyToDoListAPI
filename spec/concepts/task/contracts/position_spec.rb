RSpec.describe Task::Contracts::Position do
  subject(:contract) { described_class.new(task) }

  let(:task) { create(:task) }

  describe '#validate' do
    before do
      create_list(:task, 3, project: task.project)
    end

    context 'when params is valid' do
      let(:task_params) { { position: task.project.tasks.count - 1 } }

      it 'returns true' do
        expect(contract.validate(task_params)).to be_truthy
      end
    end

    context 'when params is invalid' do
      it 'returns false' do
        expect(contract.validate({})).to be_falsey
      end
    end

    context 'when position is empty' do
      let(:position_params) { { position: '' } }

      it 'contains position error' do
        contract.validate(position_params)
        expect(contract.errors[:position]).not_to be_empty
      end
    end

    context 'when position is negative number' do
      let(:position_params) { { position: -1 } }

      it 'contains position error' do
        contract.validate(position_params)
        expect(contract.errors[:position]).not_to be_empty
      end
    end

    context 'when position is bigger than tasks amount' do
      let(:position_params) { { position: task.project.tasks.count + 1 } }

      it 'contains position error' do
        contract.validate(position_params)
        expect(contract.errors[:position]).not_to be_empty
      end
    end

    context 'when position is the same' do
      let(:position_params) { { position: task.position } }

      it 'contains position error' do
        contract.validate(position_params)
        expect(contract.errors[:position]).not_to be_empty
      end
    end
  end
end
