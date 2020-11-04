RSpec.describe Session::Update do
  describe '#call' do
    let(:default_params) { {} }
    let(:expected_attrs) { {} }

    context 'when params is valid' do
      let(:user_params) { attributes_for(:user) }
      let(:default_options) { { request: test_request(user_params: user_params) } }

      before do
        create(:user, **user_params)
      end

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), {} do |result|
          expect(result[:tokens]).not_to be_nil
        end
      end
    end

    context 'when params is invalid' do
      let(:default_options) { { request: test_request } }

      it 'returns policy error' do
        assert_policy_fail described_class, ctx({}, deep_merge: false)
      end
    end
  end
end
