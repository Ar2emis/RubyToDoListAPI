RSpec.describe Api::V1::Guard::Refresh do
  describe '#call' do
    subject(:guard) { described_class.new }

    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end
    let(:request) { test_request(user_params: user_params) }
    let(:ctx) { {} }

    context 'when access token is valid' do
      it 'returns true' do
        expect(guard.call(ctx, request: request)).to eq true
      end

      it 'returns current user' do
        guard.call(ctx, request: request)
        expect(ctx[:current_user]).not_to be_nil
      end
    end

    context 'when access token is invalid' do
      it 'returns false' do
        expect(guard.call(ctx, request: test_request)).to eq false
      end
    end
  end
end
