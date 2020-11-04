RSpec.describe Task::Contracts::Create do
  subject(:contract) { described_class.new(Task.new) }

  describe '#validate' do
    context 'when params is valid' do
      let(:task_params) { { name: attributes_for(:task)[:name] } }

      it 'returns true' do
        expect(contract.validate(task_params)).to be_truthy
      end
    end

    context 'when params is invalid' do
      it 'returns false' do
        expect(contract.validate({})).to be_falsey
      end
    end

    context 'when name is empty' do
      let(:task_params) { { name: '' } }

      it 'contains name error' do
        contract.validate(task_params)
        expect(contract.errors[:name]).not_to be_empty
      end
    end
  end
end
