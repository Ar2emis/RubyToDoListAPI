RSpec.describe Api::V1::User::Contract::Create do
  subject(:contract) { described_class.new(User.new) }

  describe '#validate' do
    context 'when params is valid' do
      let(:user_params) { attributes_for(:new_user) }

      it 'returns true' do
        expect(contract.validate(user_params)).to eq true
      end
    end

    context 'when params is invalid' do
      it 'returns false' do
        expect(contract.validate({})).to eq false
      end
    end

    {
      username: [
        { message: 'is empty', value: '' },
        { message: 'is too long', value: 'a' * (::Constants::USERNAME_LENGTH.max + 1) },
        { message: 'is too short', value: 'a' * (::Constants::USERNAME_LENGTH.min - 1) }
      ],
      password: [
        { message: 'is empty', value: '' },
        { message: 'is too short', value: 'a' * (::Constants::PASSWORD_MIN_LENGTH - 1) }
      ],
      password_confirmation: [
        { message: 'is empty', value: '' }
      ]
    }.each do |property, incidents|
      incidents.each do |incident|
        context "when #{property} #{incident[:message]}" do
          it "contains #{property} error" do
            contract.validate({ property => incident[:value] })
            expect(contract.errors[property]).not_to be_empty
          end
        end
      end
    end

    context 'when password_confirmation does not match' do
      let(:user_params) do
        params = attributes_for(:new_user)
        params[:password_confirmation] = params[:password_confirmation].reverse
        params
      end

      it 'contains password_confirmation error' do
        contract.validate(user_params)
        expect(contract.errors[:password_confirmation]).not_to be_empty
      end
    end

    context 'when username is already taken' do
      let(:user_params) { attributes_for(:new_user, username: create(:user).username) }

      it 'contains username error' do
        contract.validate(user_params)
        expect(contract.errors[:username]).not_to be_empty
      end
    end
  end
end
