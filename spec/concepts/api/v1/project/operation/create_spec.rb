RSpec.describe Api::V1::Project::Operation::Create do
  describe '#call' do
    let(:project_params) { attributes_for(:project).merge(user: create(:user)) }

    context 'when params valid' do
      it 'success' do
        expect(described_class.call(params: project_params)).to be_success
      end

      it 'creates project' do
        expect { described_class.call(params: project_params) }.to change(Project, :count).by(1)
      end
    end

    context 'when params is invalid' do
      let(:project_params) { attributes_for(:project, name: '') }

      it 'fails with contract error' do
        expect(described_class.call(params: project_params)['result.contract.default']).to be_failure
      end
    end
  end
end
