class LeasesController < ApplicationController
  before_action :set_lease, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /leases
  # GET /leases.json
  def index
    @leases = Lease.all
  end

  # GET /leases/1
  # GET /leases/1.json
  def show
  end

  # GET /leases/new
  def new
    @lease = current_user.leases.build
  end

  # GET /leases/1/edit
  def edit
  end

  # POST /leases
  # POST /leases.json
  def create
    @lease = current_user.leases.build(lease_params)

    respond_to do |format|
      if @lease.save
        format.html { redirect_to @lease, notice: 'Arrendamiento creado correctamente.' }
        format.json { render :show, status: :created, location: @lease }
      else
        format.html { render :new }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leases/1
  # PATCH/PUT /leases/1.json
  def update
    respond_to do |format|
      if @lease.update(lease_params)
        format.html { redirect_to @lease, notice: 'Arrendamiento actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @lease }
      else
        format.html { render :edit }
        format.json { render json: @lease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leases/1
  # DELETE /leases/1.json
  def destroy
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to leases_url, notice: 'Arrendamiento eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end

    def correct_user
      @lease = current_user.leases.find_by(id: params[:id])
      redirect_to leases_path, notice: 'No está autorizado para modificar este Arrendamiento' if @lease.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lease_params
      params.require(:lease).permit(:adviser_id, :name, :cant)
    end
end
