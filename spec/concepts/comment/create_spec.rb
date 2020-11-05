RSpec.describe Comment::Create do
  describe '#call' do
    let(:user_params) { attributes_for(:user) }
    let!(:user) { create(:user, **user_params) }
    let(:default_options) { { request: test_request(user_params: user_params) } }
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:default_params) { { task_id: task.id, data: attributes_for(:comment) } }

    context 'when params valid' do
      let(:expected_attrs) { default_params[:data].except(:image) }

      it 'success' do
        assert_pass described_class, ctx({}, deep_merge: false), {}
      end

      it 'creates new comment' do
        expect { call(described_class, **ctx({}, deep_merge: false)) }.to change(Comment, :count).by(1)
      end
    end

    context 'when body empty' do
      let(:task_params) { { body: '' } }

      it 'fails with body error' do
        assert_fail described_class, ctx({ data: task_params }, deep_merge: false), expected_errors: [:body]
      end
    end

    context 'when image invalid' do
      let(:task_params) { attributes_for(:comment).merge(image: 'asdfg') }

      it 'fails with image error' do
        assert_fail described_class, ctx({ data: task_params }, deep_merge: false), expected_errors: [:image]
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
