RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }
    it { is_expected.to have_many(:tasks).through(:projects) }
    it { is_expected.to have_many(:comments).through(:tasks) }
  end

  describe 'db fields' do
    it { is_expected.to have_db_column(:username) }
    it { is_expected.to have_db_column(:password_digest) }
    it { is_expected.to have_db_column(:provider) }
    it { is_expected.to have_db_column(:uid) }
    it { is_expected.to have_db_index(:username) }
  end
end
