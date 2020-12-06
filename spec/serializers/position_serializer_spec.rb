RSpec.describe PositionSerializer do
  subject(:serializer) { described_class.new(task) }

  let(:task) { create(:task) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('position')
    end
  end
end
