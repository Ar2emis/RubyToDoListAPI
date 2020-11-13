RSpec.describe 'Api::V1::Auth::Sessions', type: :request do
  include Docs::V1::Sessions::Api

  describe 'POST /api/v1/auth/sign_in' do
    include Docs::V1::Sessions::Create

    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end

    before do
      post api_v1_auth_sign_in_path, params: user_params, as: :json
    end

    context 'when params is valid' do
      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns user', :dox do
        expect(response.body).to match_json_schema(:user)
      end

      it 'returns authorization token' do
        expect(response.headers[JWTSessions.access_header]).not_to be_nil
      end

      it 'returns refresh token' do
        expect(response.headers[JWTSessions.refresh_header]).not_to be_nil
      end
    end

    context 'when params is invalid' do
      let(:user_params) { {} }

      it 'returns http unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'PATCH /api/v1/auth/refresh' do
    include Docs::V1::Sessions::Update

    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end
    let(:tokens) { Api::V1::Session::Operation::Create.call(params: user_params)[:headers] }
    let(:refresh_token) { tokens[JWTSessions.refresh_header] }
    let(:access_token) { tokens[JWTSessions.access_header] }

    before do
      patch api_v1_auth_refresh_path, headers: { JWTSessions.refresh_header => refresh_token }, as: :json
    end

    context 'when refresh token is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns new access token', :dox do
        expect(response.headers[JWTSessions.access_header]).not_to eq access_token
      end

      it 'returns user' do
        expect(response.body).to match_json_schema(:user)
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
    include Docs::V1::Sessions::Destroy

    let(:user_params) do
      attributes = attributes_for(:user)
      create(:user, **attributes)
      attributes
    end
    let(:refresh_token) do
      Api::V1::Session::Operation::Create.call(params: user_params)[:headers][JWTSessions.refresh_header]
    end

    before do
      delete api_v1_auth_sign_out_path, headers: { JWTSessions.refresh_header => refresh_token }, as: :json
    end

    context 'when refresh token is valid' do
      it 'returns http ok status' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns success message', :dox do
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
