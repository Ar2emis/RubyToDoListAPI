RSpec.describe Api::V1::GenerateHeadersService do
  describe '.call' do
    let(:user) { create(:user) }

    it 'returns headers hash' do
      expect(described_class.call(user: user)).to be_a Hash
    end

    it 'returns hash which contains access header' do
      expect(described_class.call(user: user)).to be_key(JWTSessions.access_header)
    end
  end
end
