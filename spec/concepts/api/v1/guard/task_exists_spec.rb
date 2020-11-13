RSpec.describe Api::V1::Guard::TaskExists do
  subject(:guard) { described_class.new }

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, user_params) }
  let!(:task) { create(:task, project: create(:project, user: user)) }
  let(:ctx) { {} }

  context 'with task id' do
    context 'when task id is valid' do
      let(:params) { { task_id: task.id } }

      it 'returns true' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq true
      end
    end

    context 'when task id is invalid' do
      let(:params) { { task_id: task.id.pred } }

      it 'returns false' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq false
      end
    end
  end

  context 'with id' do
    context 'when id is valid' do
      let(:params) { { id: task.id } }

      it 'returns true' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq true
      end
    end

    context 'when id is invalid' do
      let(:params) { { id: task.id.pred } }

      it 'returns false' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq false
      end
    end
  end
end
