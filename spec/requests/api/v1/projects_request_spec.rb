RSpec.describe 'Api::V1::Projects', type: :request do
  include Docs::V1::Projects::Api

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, **user_params) }
  let(:headers) { Api::V1::Session::Operation::Create.call(params: user_params)[:headers] }

  describe 'GET /api/v1/projects' do
    include Docs::V1::Projects::Index

    before do
      get api_v1_projects_path, headers: headers, as: :json
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns projects', :dox do
      expect(response.body).to match_json_schema('project')
    end
  end

  describe 'GET /api/v1/projects/{id}' do
    include Docs::V1::Projects::Show
    let(:project) { create(:project, user: user) }

    before do
      get api_v1_project_path(project), headers: headers, as: :json
    end

    it 'returns http ok status' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns project', :dox do
      expect(response.body).to match_json_schema('project')
    end
  end

  describe 'PATCH /api/v1/projects/{id}' do
    include Docs::V1::Projects::Update
    let(:project) { create(:project, user: user) }
    let(:params) { attributes_for(:project) }

    before do
      patch api_v1_project_path(project), params: params, headers: headers, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns project', :dox do
        expect(response.body).to match_json_schema('project')
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

  describe 'POST /api/v1/projects' do
    include Docs::V1::Projects::Create
    let(:params) { attributes_for(:project) }

    before do
      post api_v1_projects_path, params: params, headers: headers, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns project', :dox do
        expect(response.body).to match_json_schema('project')
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

  describe 'DELETE /api/v1/projects/{id}' do
    include Docs::V1::Projects::Destroy
    let(:project) { create(:project, user: user) }

    before do
      delete api_v1_project_path(project), headers: headers, as: :json
    end

    context 'when project exists' do
      it 'returns http no content status', :dox do
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when project does not exist' do
      let(:project) { create(:project) }

      it 'returns http not found status' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
