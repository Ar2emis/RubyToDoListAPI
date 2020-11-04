RSpec.describe Task, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:project) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
  end

  describe 'db fields' do
    %i[name project_id].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end
end
