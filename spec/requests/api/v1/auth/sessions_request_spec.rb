RSpec.describe 'Api::V1::Auth::Sessions', type: :request do
  describe 'POST /api/v1/auth/sign_in' do
    let(:user_data) { attributes_for(:user) }
    let!(:user) { create(:user, **user_data) }

    before do
      post api_v1_auth_sign_in_path, params: user_data
    end

    context 'when params is valid' do
      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns user data' do
        user_json = UserSerializer.new(user).to_json
        expect(response.body).to eq user_json
      end

      it 'returns authorization token' do
        expect(response.headers[JWTSessions.access_header]).not_to be_nil
      end

      it 'returns refresh token' do
        expect(response.headers[JWTSessions.refresh_header]).not_to be_nil
      end
    end

    context 'when params is invalid' do
      let(:user_data) { {} }

      it 'returns http unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PATCH /api/v1/auth/refresh' do
    let(:user_params) { attributes_for(:user) }
    let(:tokens) { call(Session::Create, params: user_params)[:tokens] }
    let(:refresh_token) { tokens[JWTSessions.refresh_header] }
    let(:access_token) { tokens[JWTSessions.access_header] }

    before do
      create(:user, **user_params)
      patch api_v1_auth_refresh_path, headers: { JWTSessions.refresh_header => refresh_token }
    end

    context 'when refresh token is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns new access token' do
        expect(response.headers[JWTSessions.access_header]).not_to eq access_token
      end
    end

    context 'when refresh token is invalid' do
      let(:refresh_token) { 'abcdefgh' }

      it 'returns http unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /api/v1/auth/sign_out' do
    let(:user_params) { attributes_for(:user) }
    let(:refresh_token) { call(Session::Create, params: user_params)[:tokens][JWTSessions.refresh_header] }

    before do
      create(:user, **user_params)
      delete api_v1_auth_sign_out_path, headers: { JWTSessions.refresh_header => refresh_token }
    end

    context 'when refresh token is valid' do
      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns success message' do
        expect(response.body).to match_json_schema('success')
      end
    end

    context 'when refresh token is invalid' do
      let(:refresh_token) { 'abcdefgh' }

      it 'returns http not found status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
