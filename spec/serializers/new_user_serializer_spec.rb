RSpec.describe NewUserSerializer do
  subject(:serializer) { described_class.new(user) }

  let(:user) { create(:user) }

  describe '#serializable_hash' do
    it 'returns schema hash' do
      expect(serializer.serializable_hash).to match_json_schema('user')
    end
  end
end
