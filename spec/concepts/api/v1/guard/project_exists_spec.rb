RSpec.describe Api::V1::Guard::ProjectExists do
  subject(:guard) { described_class.new }

  let(:user_params) { attributes_for(:user) }
  let!(:user) { create(:user, user_params) }
  let!(:project) { create(:project, user: user) }
  let(:ctx) { {} }

  context 'with project id' do
    context 'when project id is valid' do
      let(:params) { { project_id: project.id } }

      it 'returns true' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq true
      end
    end

    context 'when project id is invalid' do
      let(:params) { { project_id: project.id.pred } }

      it 'returns false' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq false
      end
    end
  end

  context 'with id' do
    context 'when id is valid' do
      let(:params) { { id: project.id } }

      it 'returns true' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq true
      end
    end

    context 'when id is invalid' do
      let(:params) { { id: project.id.pred } }

      it 'returns false' do
        expect(guard.call(ctx, current_user: user, params: params)).to eq false
      end
    end
  end
end
