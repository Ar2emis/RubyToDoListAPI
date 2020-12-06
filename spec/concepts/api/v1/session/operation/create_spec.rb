RSpec.describe Api::V1::Session::Operation::Create do
  describe '#call' do
    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end

    context 'when params is valid' do
      it 'success' do
        expect(described_class.call(params: user_params)).to be_success
      end
    end

    context 'when params is invalid' do
      let(:params) { user_params.slice(:username) }

      it 'returns contract error' do
        expect(described_class.call(params: params)['result.contract.default']).to be_failure
      end
    end
  end
end
