RSpec.describe 'Api::V1::Tasks', type: :request do
  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, **user_params) }
  let(:headers) { call(Session::Create, params: user_params)[:tokens] }

  describe 'GET /api/v1/projects/{id}/tasks' do
    before do
      project = create(:project, user: user)
      create_list(:task, 3, project: project)
      get api_v1_project_tasks_path(project), headers: headers
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns tasks data' do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'GET /api/v1/task/{id}' do
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      get api_v1_task_path(task), headers: headers
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns task data' do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'PATCH /api/v1/task/{id}' do
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:params) { { data: attributes_for(:task) } }

    before do
      patch api_v1_task_path(task), params: params, headers: headers
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns task data' do
        expect(response.body).to match_json_schema('task')
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

  describe 'POST /api/v1/projects/{project_id}/tasks' do
    let(:project) { create(:project, user: user) }
    let(:params) { { data: attributes_for(:task) } }

    before do
      post api_v1_project_tasks_path(project), params: params, headers: headers
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns task data' do
        expect(response.body).to match_json_schema('task')
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

  describe 'DELETE /api/v1/tasks/{id}' do
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      delete api_v1_task_path(task), headers: headers
    end

    context 'when task exists' do
      it 'returns http no content status' do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when task does not exist' do
      let(:task) { create(:task) }

      it 'returns http not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe 'PATCH /api/v1/task/{task_id}/complete' do
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      patch api_v1_task_complete_path(task), headers: headers
    end

    it 'returns http created status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns task data' do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'PATCH /api/v1/task/{task_id}/position' do
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:params) { { data: { position: task.position.next } } }

    before do
      create_list(:task, 3, project: task.project)
      patch api_v1_task_position_path(task), params: params, headers: headers
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns task data' do
        expect(response.body).to match_json_schema('task')
      end
    end

    context 'when params is invalid' do
      let(:params) { { data: { position: task.project.tasks.count } } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(response.body).to match_json_schema('errors')
      end
    end
  end
end
