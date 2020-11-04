RSpec.describe Comment::Contracts::Create do
  subject(:contract) { described_class.new(Comment.new) }

  describe '#validate' do
    context 'when params is valid' do
      let(:comment_params) { attributes_for(:comment) }

      it 'returns true' do
        expect(contract.validate(comment_params)).to be_truthy
      end
    end

    context 'when params is invalid' do
      it 'returns false' do
        expect(contract.validate({})).to be_falsey
      end
    end

    context 'when body is empty' do
      let(:project_params) { { body: '' } }

      it 'contains body error' do
        contract.validate(project_params)
        expect(contract.errors[:body]).not_to be_empty
      end
    end

    context 'when image is invalid' do
      let(:project_params) { { image: Rack::Test::UploadedFile.new('spec/fixtures/files/non_image.txt') } }

      it 'contains body error' do
        contract.validate(project_params)
        expect(contract.errors[:image]).not_to be_empty
      end
    end
  end
end
