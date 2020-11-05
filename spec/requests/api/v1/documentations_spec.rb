RSpec.describe 'Api::V1::Documentations', type: :request do
  describe 'GET /api/v1/docs' do
    it 'returns http ok status' do
      get api_v1_docs_path
      expect(response).to have_http_status(:ok)
    end
  end
end
