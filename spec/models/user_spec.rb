RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:projects).dependent(:destroy) }

    { tasks: :projects, comments: :tasks }.each do |models, through_models|
      it { is_expected.to have_many(models).through(through_models) }
    end
  end

  describe 'db fields' do
    %i[username password_digest provider uid].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end
end
