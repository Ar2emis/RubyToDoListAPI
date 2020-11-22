RSpec.describe Api::V1::Task::Service::Reprioritate do
  describe '.call' do
    let(:tasks) { create_list(:task, 3, project: create(:project)) }

    context 'when UP' do
      let(:task) { tasks.last }

      it 'decreases task position by 1' do
        expect { described_class.call(task: task, position: described_class::UP) }.to change(task, :position).by(-1)
      end
    end

    context 'when DOWN' do
      let(:task) { tasks.first }

      it 'increases task position by 1' do
        expect { described_class.call(task: task, position: described_class::DOWN) }.to change(task, :position).by(1)
      end
    end
  end
end
