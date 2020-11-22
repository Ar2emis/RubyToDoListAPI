RSpec.describe Api::V1::User::Operation::Create do
  describe '#call' do
    let(:user_params) { attributes_for(:new_user) }

    context 'when params valid' do
      it 'success' do
        expect(described_class.call(params: user_params)).to be_success
      end

      it 'creates user' do
        expect { described_class.call(params: user_params) }.to change(User, :count).by(1)
      end
    end

    context 'when params is invalid' do
      it 'retuns contract error' do
        expect(described_class.call(params: {})['result.contract.default']).to be_failure
      end
    end
  end
end
