RSpec.describe 'Api::V1::Registrations', type: :request do
  include Docs::V1::Registrations::Api

  describe 'POST /api/v1/auth' do
    include Docs::V1::Registrations::Create

    let(:user_data) { attributes_for(:new_user) }

    before do
      post api_v1_auth_path, params: user_data, as: :json
    end

    context 'when params is valid' do
      it 'returns http created status' do
        expect(response).to have_http_status(:created)
      end

      it 'returns created user', :dox do
        expect(response.body).to match_json_schema('new_user')
      end
    end

    context 'when params is invalid' do
      let(:user_data) { {} }

      it 'returns http unprocessable entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns errors' do
        expect(response.body).to match_json_schema('errors')
      end
    end
  end
end
