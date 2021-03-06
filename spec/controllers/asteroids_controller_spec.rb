require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AsteroidsController do

  # This should return the minimal set of attributes required to create a valid
  # Asteroid. As you add validations to Asteroid, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { 
      full_name: "1 Ceres", 
      a: 0.276788083e1, 
      e: 0.7568277e-1, 
      i: 0.1059240163e2, 
      om: 0.8030985818e2, 
      w: 0.7290778936e2, 
      q: 0.255839994e1, 
      ad: 0.297736171e1, 
      per_y: 0.460499627e1, 
      data_arc: 67279, 
      condition_code: 0, 
      n_obs_used: 6461, 
      n_del_obs_used: nil, 
      n_dop_obs_used: nil, 
      h: 0.334e1, 
      diameter: 0.9394e3, 
      extent: "964.4 x 964.2 x 891.8", 
      albedo: 0.9e-1, 
      rot_per: 0.907417e1, 
      gm: 0.626284e2, 
      bv: 0.713e0, 
      ub: 0.426e0, 
      spec_b: "C", 
      spec_t: "G"
    }
  }

  let(:invalid_attributes) {
    {
      xyz: 123,
      i: 'not a number'
    }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AsteroidsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all asteroids as @asteroids" do
      asteroid = Asteroid.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:asteroids)).to eq([asteroid])
    end

    it 'gets JSON index' do
      FactoryBot.create :asteroid, full_name: 'Thing 1', diameter: 101, rot_per: 1, albedo: 1
      FactoryBot.create :asteroid, full_name: 'Thing 2', diameter: 1,   rot_per: 1, albedo: 1
      
      get :index, params: {
          draw: 1,
          columns: {
            '0' => {
              data: 0,
              name: 'id',
              searchable: true,
              orderable: true,
              search: {
                value: '',
                regex: false
              }
            }, 
            '1' => {
              data: 1,
              name: 'name',
              searchable: true,
              orderable: true,
              search: {
                value: '',
                regex: false
              }
            }, 
            '2' => {
              data: 2,
              name: 'rotations',
              searchable: true,
              orderable: true,
              search: {
                value: '',
                regex: false
              }
            }, 
            '3' => {
              data: 3,
              name: 'albedo',
              searchable: true,
              orderable: true,
              search: {
                value: '',
                regex: false
              }
            }, 
            '4' => {
              data: 4,
              name: 'diameter',
              searchable: true,
              orderable: true,
              search: {
                value: '',
                regex: false
              }
            }
          },
          order: {
            '0' => {
              column: 4,
              dir: 'asc'
            }
          },
          start: 0,
          length: 20
        }, session: valid_session, format: :json
      expect(response).to be_successful
      # TODO: how to test if 'order' is called in model
    end

  end

  describe "GET #show" do
    it "assigns the requested asteroid as @asteroid" do
      asteroid = Asteroid.create! valid_attributes
      get :show, params: {id: asteroid.to_param}, session: valid_session
      expect(assigns(:asteroid)).to eq(asteroid)
    end
  end

  describe "GET #new" do
    it "assigns a new asteroid as @asteroid" do
      get :new, params: {}, session: valid_session
      expect(assigns(:asteroid)).to be_a_new(Asteroid)
    end
  end

  describe "GET #edit" do
    it "assigns the requested asteroid as @asteroid" do
      asteroid = Asteroid.create! valid_attributes
      get :edit, params: {id: asteroid.to_param}, session: valid_session
      expect(assigns(:asteroid)).to eq(asteroid)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Asteroid" do
        expect {
          post :create, params: {asteroid: valid_attributes}, session: valid_session
        }.to change(Asteroid, :count).by(1)
      end

      it "assigns a newly created asteroid as @asteroid" do
        post :create, params: {asteroid: valid_attributes}, session: valid_session
        expect(assigns(:asteroid)).to be_a(Asteroid)
        expect(assigns(:asteroid)).to be_persisted
      end

      it "redirects to the created asteroid" do
        post :create, params: {asteroid: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Asteroid.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved asteroid as @asteroid" do
        post :create, params: {asteroid: invalid_attributes}, session: valid_session
        expect(assigns(:asteroid)).to be_a_new(Asteroid)
      end

      it "re-renders the 'new' template" do
        post :create, params: {asteroid: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested asteroid" do
        asteroid = Asteroid.create! valid_attributes
        put :update, params: {id: asteroid.to_param, asteroid: new_attributes}, session: valid_session
        asteroid.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested asteroid as @asteroid" do
        asteroid = Asteroid.create! valid_attributes
        put :update, params: {id: asteroid.to_param, asteroid: valid_attributes}, session: valid_session
        expect(assigns(:asteroid)).to eq(asteroid)
      end

      it "redirects to the asteroid" do
        asteroid = Asteroid.create! valid_attributes
        put :update, params: {id: asteroid.to_param, asteroid: valid_attributes}, session: valid_session
        expect(response).to redirect_to(asteroid)
      end
    end

    context "with invalid params" do
      it "assigns the asteroid as @asteroid" do
        asteroid = Asteroid.create! valid_attributes
        put :update, params: {id: asteroid.to_param, asteroid: invalid_attributes}, session: valid_session
        expect(assigns(:asteroid)).to eq(asteroid)
      end

      it "re-renders the 'edit' template" do
        asteroid = Asteroid.create! valid_attributes
        put :update, params: {id: asteroid.to_param, asteroid: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested asteroid" do
      asteroid = Asteroid.create! valid_attributes
      expect {
        delete :destroy, params: {id: asteroid.to_param}, session: valid_session
      }.to change(Asteroid, :count).by(-1)
    end

    it "redirects to the asteroids list" do
      asteroid = Asteroid.create! valid_attributes
      delete :destroy, params: {id: asteroid.to_param}, session: valid_session
      expect(response).to redirect_to(asteroids_url)
    end
  end

end
