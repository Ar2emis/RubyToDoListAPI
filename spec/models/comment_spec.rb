RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:task) }
  end

  describe 'db fields' do
    %i[body image_data].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end
end
