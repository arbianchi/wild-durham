class ObservationsController < ApplicationController
  before_action :set_observation, only: [:show, :edit, :update, :destroy]
  skip_after_action :verify_authorized, only: [:index, :new, :show, :create, :destroy]
  skip_before_filter  :verify_authenticity_token

  def index
    @observations = Observation.all
    # authorize @observations
  end

  def show
    @observation = Observation.find(params[:id])
    # @observations = @observation
    # authorize @observation
  end


  def new
    @observation = Observation.new
    # authorize @observation
  end

  def edit
    @observation = Observation.find(params[:id])
    # @observations = @observation
    # authorize @observation
  end

  def create
    @observation = Observation.new(observation_params)
    # authorize @observation

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

  # PATCH/PUT /observations/1
  # PATCH/PUT /observations/1.json
  def update
    respond_to do |format|
      if @observation.update(observation_params)
        format.html { redirect_to @observation, notice: 'Observation was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation }
      else
        format.html { render :edit }
        format.json { render json: @observation.errors, status: :unprocessable_entity }
      end
      # authorize @observation
    end
  end

  # DELETE /observations/1
  # DELETE /observations/1.json
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

  # Never trust parameters from the scary internet, only allow the white list through.
  def observation_params
    params.require(:observation).permit(:phone, :created_by, :sighted_at, :description, :pic)
  end
end
