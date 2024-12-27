# frozen_string_literal: true

class AddressesController < ApplicationController
  before_action :set_proponent
  before_action :set_address, only: %i[show edit update destroy]

  # GET /proponents/:proponent_id/addresses
  def index
    @addresses = @proponent.addresses
  end

  # GET /proponents/:proponent_id/addresses/:id
  def show; end

  # GET /proponents/:proponent_id/addresses/new
  def new
    @address = @proponent.addresses.new
  end

  # POST /proponents/:proponent_id/addresses
  def create
    @address = @proponent.addresses.new(address_params)

    if @address.save
      redirect_to proponent_path(@proponent, tab: 'address'), notice: 'Endereço foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /proponents/:proponent_id/addresses/:id/edit
  def edit; end

  # PATCH/PUT /proponents/:proponent_id/addresses/:id
  def update
    if @address.update(address_params)
      redirect_to  proponent_path(@proponent, tab: 'address'), notice: 'Endereço foi atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /proponents/:proponent_id/addresses/:id
  def destroy
    @address.destroy
    redirect_to proponent_path(@proponent, tab: 'address'), notice: 'Endereço foi excluído com sucesso.'
  end

  private

    def set_proponent
      @proponent = Proponent.find(params[:proponent_id])
    end

    def set_address
      @address = @proponent.addresses.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:kind, :street, :number, :complement, :district, :city, :state, :zip_code)
    end
end
