class ProponentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :inss_discount
  before_action :set_proponent, only: %i[ show edit update destroy ]

  has_scope :by_name
  has_scope :by_inss_level

  # GET /proponents or /proponents.json
  def index
    @proponents = apply_scopes(Proponent.all).page(params[:page]).per(5)
  end

  # GET /proponents/1 or /proponents/1.json
  def show
    @tab = params[:tab] || "personal"
  end

  # GET /proponents/new
  def new
    @proponent = Proponent.new
  end

  # GET /proponents/1/edit
  def edit
  end

  # POST /proponents or /proponents.json
  def create
    @proponent = Proponent.new(proponent_params)

    respond_to do |format|
      if @proponent.save
        format.html { redirect_to @proponent, notice: "Proponent was successfully created." }
        format.json { render :show, status: :created, location: @proponent }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /proponents/inss_discount
  def inss_discount
    income = params[:income].to_f
    discount = Proponent.calculate_inss_discount(income)

    render json: { discount: discount }
  end

  # PATCH/PUT /proponents/1 or /proponents/1.json
  def update
    respond_to do |format|
      if @proponent.update(proponent_params)
        format.html { redirect_to @proponent, notice: "Proponent was successfully updated." }
        format.json { render :show, status: :ok, location: @proponent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @proponent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proponents/1 or /proponents/1.json
  def destroy
    @proponent.destroy!

    respond_to do |format|
      format.html { redirect_to proponents_path, status: :see_other, notice: "Proponent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proponent
      @proponent = Proponent.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def proponent_params
      params.expect(proponent: [ :name, :birthdate, :income ])
    end
end
