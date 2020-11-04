RSpec.describe Guard::Access do
  describe '#call' do
    subject(:guard) { described_class.new }

    let(:user_params) { attributes_for(:user) }
    let(:request) { test_request(user_params: user_params) }
    let(:ctx) { {} }

    before do
      create(:user, **user_params)
    end

    context 'when access token is valid' do
      it 'returns true' do
        expect(guard.call(ctx, request: request)).to be_truthy
      end

      it 'returns current user' do
        guard.call(ctx, request: request)
        expect(ctx[:current_user]).not_to be_nil
      end
    end

    context 'when access token is invalid' do
      it 'returns false' do
        expect(guard.call(ctx, request: test_request)).to be_falsey
      end
    end
  end
end
