RSpec.describe Guard::SignIn do
  describe '#call' do
    subject(:guard) { described_class.new }

    let(:user_params) { attributes_for(:user) }
    let(:ctx) { {} }

    context 'when credentials are valid' do
      before do
        create(:user, **user_params)
      end

      it 'returns true' do
        expect(guard.call(ctx, params: user_params)).to be_truthy
      end

      it 'returns current user' do
        guard.call(ctx, params: user_params)
        expect(ctx[:current_user]).not_to be_nil
      end
    end

    context 'when credentials are invalid' do
      it 'returns false' do
        expect(guard.call(ctx, params: {})).to be_falsey
      end
    end
  end
end
