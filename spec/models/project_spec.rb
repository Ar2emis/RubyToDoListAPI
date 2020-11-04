RSpec.describe Project, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  describe 'db fields' do
    %i[name user_id].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end
end
