class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create, :destroy]
  skip_before_filter  :verify_authenticity_token

  def index
    @observations = Observation.all
  end

  def show
    @observation = Observation.find(params[:id])
  end


  def new
    @observation = Observation.new
  end

  def edit
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  def create
    @observation = Observation.new(observation_params)

    respond_to do |format|
      if @observation.save
        format.html { redirect_to @observation, notice: 'Observation was successfully created.' }
        format.json { render :show, status: :created, location: @observation }
      else
        format.html { render :new }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    @observation = Observation.find(params[:id])

    authorize @observation

    respond_to do |format|
      if @observation.update(description: params[:description], pic: params[:pic])
        format.html { redirect_to @observation, notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @observation.destroy
    respond_to do |format|
      format.html { redirect_to observations_url, notice: 'Observation was successfully destroyed.' }
      format.json { head :no_content }
    end
    # authorize @observation
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_observation
    @observation = Observation.find(params[:id])
    # authorize @observation
  end

  def observation_params
    params.require(:observation).permit(:phone, :created_by, :sighted_at, :description, :pic)
  end
end
