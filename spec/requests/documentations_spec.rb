RSpec.describe 'Documentations', type: :request do
  describe 'GET /api/v1/docs' do
    it 'returns http ok status' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
