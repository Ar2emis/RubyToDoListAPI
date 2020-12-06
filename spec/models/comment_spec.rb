RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:task) }
  end

  describe 'db fields' do
    it { is_expected.to have_db_column(:body).with_options(null: false) }
    it { is_expected.to have_db_column(:image_data) }
    it { is_expected.to have_db_column(:task_id) }
    it { is_expected.to have_db_index(:task_id) }
  end
end
