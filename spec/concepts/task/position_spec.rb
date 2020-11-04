RSpec.describe Task::Position do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:default_options) { { request: test_request(user_params: user_params) } }
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:default_params) { { task_id: task.id, data: { position: task.position + 1 } } }

    context 'when params is valid' do
      let(:expected_attrs) { default_params[:data] }

      before do
        create_list(:task, 3, project: task.project)
      end

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), {}
      end

      it 'swaps positions with anothers task in project' do
        call described_class, **ctx({}, deep_merge: false)
        expect(task.project.tasks.where(position: task.position).count).to eq 1
      end
    end

    context 'when passed position is the same' do
      let(:position_params) { { data: { postion: task.position } } }

      it 'fails with postion error' do
        assert_fail described_class, ctx(position_params, deep_merge: false), expected_errors: [:position]
      end
    end

    context 'when passed position is invalid' do
      let(:position_params) { { data: { postion: task.project.tasks.count + 1 } } }

      it 'fails with postion error' do
        assert_fail described_class, ctx(position_params, deep_merge: false), expected_errors: [:position]
      end
    end

    context 'when task does not exists' do
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
