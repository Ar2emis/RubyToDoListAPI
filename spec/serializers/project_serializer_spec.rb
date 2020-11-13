RSpec.describe ProjectSerializer do
  subject(:serializer) { described_class.new(project) }

  let(:project) { create(:project, tasks: create_list(:task, 3)) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('project')
    end
  end
end
