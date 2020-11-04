RSpec.describe ProjectSerializer do
  subject(:serializer) { described_class.new(project) }

  let(:project) { create(:project) }

  before do
    project.tasks = create_list(:task, 3)
  end

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('project')
    end
  end
end
