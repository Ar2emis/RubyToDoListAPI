RSpec.describe Api::V1::Project::Operation::Index do
  describe '#call' do
    let(:user) do
      create(:user, projects: create_list(:project, 3))
    end

    context 'when valid params' do
      it 'success' do
        expect(described_class.call(params: {}, current_user: user)).to be_success
      end
    end
  end
end
