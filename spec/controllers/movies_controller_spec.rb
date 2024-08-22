# spec/controllers/movies_controller_spec.rb
require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:movie) { create(:movie, title: 'Test Movie') }
  let(:valid_attributes) { { title: 'New Movie' } }
  let(:invalid_attributes) { { title: '' } }

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
      expect(assigns(:movies)).to match_array([movie])
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Movie' do
        expect {
          post :create, params: { movie_form: valid_attributes }

        }.to change(Movie, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'does not create a new Movie' do
        expect {
          post :create, params: { movie_form: invalid_attributes }
        }.not_to change(Movie, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested movie' do
        put :update, params: { id: movie.to_param, movie_form: valid_attributes }
        movie.reload
        expect(movie.title).to eq('New Movie')
      end
    end

    context 'with invalid params' do
      it 'does not update the movie' do
        put :update, params: { id: movie.to_param, movie_form: invalid_attributes }
        movie.reload
        expect(movie.title).to eq('Test Movie')
      end
    end
  end

end
