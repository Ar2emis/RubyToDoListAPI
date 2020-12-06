RSpec.describe Api::V1::Task::Contract::Update do
  subject(:contract) { described_class.new(build(:task)) }

  describe '#validate' do
    context 'when params is valid' do
      let(:task_params) { attributes_for(:task) }

      it 'returns true' do
        expect(contract.validate(task_params)).to eq true
      end
    end

    context 'when params is invalid' do
      let(:task_params) { { name: '' } }

      it 'returns false' do
        expect(contract.validate(task_params)).to eq false
      end
    end

    {
      name: [
        { message: 'is empty', value: '' }
      ],
      due_date: [
        { message: 'is empty', value: '' },
        { message: 'is invalid', value: FFaker::Music.song },
        { message: 'is passed', value: Time.zone.yesterday }
      ]
    }.each do |property, incidents|
      incidents.each do |incident|
        context "when #{property} #{incident[:message]}" do
          it "contains #{property} error" do
            contract.validate({ property => incident[:value] })
            expect(contract.errors[property]).not_to be_empty
          end
        end
      end
    end
  end
end
