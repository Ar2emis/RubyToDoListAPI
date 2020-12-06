RSpec.describe CommentSerializer do
  subject(:serializer) { described_class.new(comment) }

  let(:comment) { create(:comment) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('comment')
    end
  end
end
