RSpec.describe UserSerializer do
  subject(:serializer) { described_class.new(user) }

  let(:user) { create(:user) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.to_json).to match_json_schema('user')
    end
  end
end
