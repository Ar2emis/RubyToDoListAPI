RSpec.describe ImageUploader do
  subject(:attacher) { described_class::Attacher.new }

  describe 'validations' do
    describe 'image extention validation' do
      let(:image) { Rack::Test::UploadedFile.new('spec/fixtures/files/image.jpg', 'image/jpeg') }
      let(:non_image) { Rack::Test::UploadedFile.new('spec/fixtures/files/non_image.txt') }

      it "allows #{described_class::IMAGE_EXTENTIONS.join(', ')} extentions" do
        attacher.attach(image)
        expect(attacher.errors).to be_empty
      end

      it 'rejects other file extentions' do
        attacher.attach(non_image)
        expect(attacher.errors).not_to be_empty
      end
    end

    describe 'image size validation' do
      let(:image) { Rack::Test::UploadedFile.new('spec/fixtures/files/image.jpg', 'image/jpeg') }

      it 'rejects big files' do
        stub_const('ImageUploader::IMAGE_SIZE_RANGE', (1..(image.size / 2)))
        attacher.attach(image)
        expect(attacher.errors).not_to be_empty
      end

      it 'allows files less than 10 mb' do
        attacher.attach(image)
        expect(attacher.errors).to be_empty
      end
    end
  end
end
