RSpec.describe Session::Create do
  describe '#call' do
    let(:default_params) { attributes_for(:user) }
    let(:expected_attrs) { default_params.except(:password) }
    let(:default_options) { { request: test_request } }

    context 'when params is valid' do
      before do
        create(:user, **default_params)
      end

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), {}
      end

      it 'returns tokens hash' do
        result = call described_class, params: default_params, **default_options
        expect(result[:tokens]).to be_a Hash
      end
    end

    context 'when params is invalid' do
      it 'returns policy error' do
        assert_policy_fail described_class, ctx({})
      end
    end
  end
end
