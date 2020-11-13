RSpec.describe Api::V1::Guard::SignIn do
  describe '#call' do
    subject(:guard) { described_class.new }

    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end
    let(:ctx) { {} }

    context 'when credentials are valid' do
      it 'returns true' do
        expect(guard.call(ctx, params: user_params)).to eq true
      end

      it 'returns current user' do
        guard.call(ctx, params: user_params)
        expect(ctx[:current_user]).not_to be_nil
      end
    end

    context 'when credentials are invalid' do
      it 'returns false' do
        expect(guard.call(ctx, params: {})).to eq false
      end
    end
  end
end
