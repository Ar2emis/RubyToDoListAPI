RSpec.describe Task::Update do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:default_options) { { request: test_request(user_params: user_params) } }
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:default_params) { { id: task.id, data: attributes_for(:task).except(:done, :position, :project) } }

    context 'when params valid' do
      let(:expected_attrs) { default_params[:data] }

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), project_id: task.project.id
      end
    end

    context 'when name empty' do
      let(:task_params) { { data: { name: '' } } }

      it 'fails with name error' do
        assert_fail described_class, ctx(task_params, deep_merge: false), expected_errors: [:name]
      end
    end

    context 'when due date is invalid' do
      let(:task_params) { { data: { due_date: '' } } }

      it 'fails with due date error' do
        assert_fail described_class, ctx(task_params, deep_merge: false), expected_errors: [:due_date]
      end
    end

    context 'when due date is already passed' do
      let(:task_params) { { data: { due_date: Time.zone.yesterday } } }

      it 'fails with due date error' do
        assert_fail described_class, ctx(task_params, deep_merge: false), expected_errors: [:due_date]
      end
    end

    context 'when task does not exist' do
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
