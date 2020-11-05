RSpec.describe Project::Create do
  describe '#call' do
    let(:default_params) { { data: attributes_for(:project) } }
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:default_options) { { request: test_request(user_params: user_params) } }

    context 'when params valid' do
      let(:expected_attrs) { default_params[:data] }

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), user_id: user.id
      end

      it 'creates project' do
        expect { call(described_class, **ctx({}, deep_merge: false)) }.to change(Project, :count).by(1)
      end
    end

    context 'when name empty' do
      let(:default_params) { { data: attributes_for(:project, name: '') } }

      it 'fails with name error' do
        assert_fail described_class, ctx({}, deep_merge: false), expected_errors: [:name]
      end
    end

    context 'when project with passed name already exists' do
      let(:project) { create(:project, user: user) }
      let(:default_params) { { data: attributes_for(:project).merge(name: project.name) } }

      it 'fails with name error' do
        assert_fail described_class, ctx({}, deep_merge: false), expected_errors: [:name]
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
