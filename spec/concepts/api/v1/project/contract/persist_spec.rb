RSpec.describe Api::V1::Project::Contract::Persist do
  subject(:contract) { described_class.new(Project.new(user: user)) }

  let(:user) { create(:user) }

  describe '#validate' do
    context 'when params is valid' do
      let(:project_params) { attributes_for(:project) }

      it 'returns true' do
        expect(contract.validate(project_params)).to eq true
      end
    end

    context 'when params is invalid' do
      it 'returns false' do
        expect(contract.validate({})).to eq false
      end
    end

    context 'when name is empty' do
      let(:project_params) { { name: '' } }

      it 'contains name error' do
        contract.validate(project_params)
        expect(contract.errors[:name]).not_to be_empty
      end
    end

    context 'when name is already taken' do
      let(:project_params) { { name: create(:project, user: user).name } }

      it 'contains name error' do
        contract.validate(project_params)
        expect(contract.errors[:name]).not_to be_empty
      end
    end
  end
end
