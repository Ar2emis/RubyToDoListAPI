RSpec.describe 'Api::V1::Comments', type: :request do
  include Docs::V1::Comments::Api

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, **user_params) }
  let(:headers) { call(Session::Create, params: user_params)[:tokens] }

  describe 'GET /api/v1/tasks/{task_id}/comments' do
    include Docs::V1::Comments::Index

    before do
      task = create(:task, project: create(:project, user: user))
      create_list(:comment, 3, task: task)
      get api_v1_task_comments_path(task), headers: headers, as: :json
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns comments', :dox do
      expect(response.body).to match_json_schema('comment')
    end
  end

  describe 'POST /api/v1/tasks/{task_id}/comments' do
    include Docs::V1::Comments::Create

    let(:params) { { data: attributes_for(:comment).slice(:body, :image) } }

    before do
      puts params
      task = create(:task, project: create(:project, user: user))
      post api_v1_task_comments_path(task), params: params, headers: headers
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns comment', :dox do
        expect(response.body).to match_json_schema('comment')
      end
    end

    context 'when params is invalid' do
      let(:params) { { data: { name: '' } } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(response.body).to match_json_schema('errors')
      end
    end
  end

  describe 'DELETE /api/v1/comments/{id}' do
    include Docs::V1::Comments::Destroy
    let(:comment) { create(:comment, task: create(:task, project: create(:project, user: user))) }

    before do
      delete api_v1_comment_path(comment), headers: headers, as: :json
    end

    context 'when comment exists' do
      it 'returns http no content status', :dox do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when comment does not exist' do
      let(:comment) { create(:comment) }

      it 'returns http not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
