RSpec.describe 'Api::V1::Tasks', type: :request do
  include Docs::V1::Tasks::Api

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, **user_params) }
  let(:headers) { Api::V1::Session::Operation::Create.call(params: user_params)[:headers] }

  describe 'GET /api/v1/projects/{id}/tasks' do
    include Docs::V1::Tasks::Index

    let(:project) { create(:project, user: user, tasks: create_list(:task, 3)) }

    before do
      get api_v1_project_tasks_path(project), headers: headers, as: :json
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns tasks', :dox do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'GET /api/v1/task/{id}' do
    include Docs::V1::Tasks::Show
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      get api_v1_task_path(task), headers: headers, as: :json
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns task', :dox do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'PATCH /api/v1/task/{id}' do
    include Docs::V1::Tasks::Update
    let(:task) { create(:task, project: create(:project, user: user)) }
    let(:params) { attributes_for(:task).slice(:name, :due_date) }

    before do
      patch api_v1_task_path(task), params: params, headers: headers, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns task', :dox do
        expect(response.body).to match_json_schema('task')
      end
    end

    context 'when params is invalid' do
      let(:params) { { name: '' } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(response.body).to match_json_schema('errors')
      end
    end
  end

  describe 'POST /api/v1/projects/{project_id}/tasks' do
    include Docs::V1::Tasks::Create
    let(:project) { create(:project, user: user) }
    let(:params) { attributes_for(:task).slice(:name) }

    before do
      post api_v1_project_tasks_path(project), params: params, headers: headers, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns task', :dox do
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
    include Docs::V1::Tasks::Destroy
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      delete api_v1_task_path(task), headers: headers, as: :json
    end

    context 'when task exists' do
      it 'returns http no content status', :dox do
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
    include Docs::V1::Tasks::Complete
    let(:task) { create(:task, project: create(:project, user: user)) }

    before do
      patch api_v1_task_complete_path(task), headers: headers, as: :json
    end

    it 'returns http created status' do
      expect(response).to have_http_status(:created)
    end

    it 'returns task', :dox do
      expect(response.body).to match_json_schema('task')
    end
  end

  describe 'PATCH /api/v1/task/{task_id}/position' do
    include Docs::V1::Tasks::Position
    let(:task) { create(:task, project: create(:project, user: user, tasks: create_list(:task, 3))) }
    let(:params) { { position: :down } }

    before do
      patch api_v1_task_position_path(task), params: params, headers: headers, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns position', :dox do
        expect(response.body).to match_json_schema('task')
      end
    end

    context 'when params is invalid' do
      let(:params) { { position: -1 } }

      it 'returns http unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(response.body).to match_json_schema('errors')
      end
    end
  end
end
