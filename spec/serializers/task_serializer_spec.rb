RSpec.describe TaskSerializer do
  subject(:serializer) { described_class.new(task) }

  let(:task) { create(:task, comments: create_list(:comment, 3)) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('task')
    end
  end
end
