RSpec.describe Api::V1::ReprioritateService do
  describe '.call' do
    let(:tasks) { create_list(:task, 3, project: create(:project)) }

    context 'when UP' do
      let(:task) { tasks.last }

      it 'decreases task position by 1' do
        expect { described_class.call(task: task, position: :up) }.to change(task, :position).by(-1)
      end
    end

    context 'when DOWN' do
      let(:task) { tasks.first }

      it 'increases task position by 1' do
        expect { described_class.call(task: task, position: :down) }.to change(task, :position).by(1)
      end
    end
  end
end
