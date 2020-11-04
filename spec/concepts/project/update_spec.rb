RSpec.describe Project::Update do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:default_options) { { request: test_request(user_params: user_params) } }
    let(:project) { create(:project, user: user) }
    let(:default_params) { { id: project.id, data: attributes_for(:project) } }

    context 'when params valid' do
      let(:expected_attrs) { default_params[:data] }

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), {}
      end
    end

    context 'when name empty' do
      it 'fails with name error' do
        assert_fail described_class, ctx({ data: { name: '' } }, deep_merge: false), expected_errors: [:name]
      end
    end

    context 'when project with passed name already exists' do
      it 'fails with name error' do
        assert_fail described_class, ctx({ data: { name: project.name } }, deep_merge: false), expected_errors: [:name]
      end
    end

    context 'when project does not exists' do
      let(:default_params) { { id: -1 } }

      it 'returns model error' do
        assert_fail described_class, ctx({}, deep_merge: false) do |result|
          expect(result[:model]).to be_nil
        end
      end
    end

    context 'when policy is invalid' do
      let(:default_options) { { request: test_request } }

      it 'returns policy error' do
        assert_policy_fail described_class, ctx({}, deep_merge: false)
      end
    end
  end
end
