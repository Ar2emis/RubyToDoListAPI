RSpec.describe User::Create do
  describe '#call' do
    let(:default_params) { attributes_for(:new_user) }
    let(:expected_attrs) { default_params.except(:password, :password_confirmation) }
    let(:default_options) { { request: test_request } }

    context 'when params valid' do
      it 'success' do
        assert_pass described_class, ctx({}), {}
      end

      it 'creates user' do
        expect { call(described_class, **ctx({}, deep_merge: false)) }.to change(User, :count).by(1)
      end
    end

    context 'when username is empty' do
      let(:username) { '' }

      it 'fails with username error' do
        assert_fail described_class, ctx({ username: username }), expected_errors: [:username]
      end
    end

    context 'when password is too short' do
      let(:short_password) { 'a' * (User::Contracts::Create::PASSWORD_MIN_LENGTH - 1) }

      it 'fails with password error' do
        assert_fail described_class, ctx(password: short_password), expected_errors: [:password]
      end
    end

    context 'when password format is invalid' do
      let(:invalid_password) { '@' * User::Contracts::Create::PASSWORD_MIN_LENGTH }

      it 'fails with password error' do
        assert_fail described_class, ctx(password: invalid_password), expected_errors: [:password]
      end
    end

    context 'when password confirmation does not match' do
      let(:invalid_password_confirmation) { default_params[:password].reverse }

      it 'fails with password confirmation error' do
        assert_fail described_class, ctx(password_confirmation: invalid_password_confirmation),
                    expected_errors: [:password_confirmation]
      end
    end

    context 'when user with passed username already exists' do
      let(:user) { create(:user) }

      it 'fails with username error' do
        assert_fail described_class, ctx(username: user.username), expected_errors: [:username]
      end
    end
  end
end
