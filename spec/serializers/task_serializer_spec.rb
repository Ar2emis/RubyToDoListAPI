RSpec.describe TaskSerializer do
  subject(:serializer) { described_class.new(task) }

  let(:task) { create(:task) }

  before do
    task.comments = create_list(:comment, 3)
  end

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('task')
    end
  end
end
