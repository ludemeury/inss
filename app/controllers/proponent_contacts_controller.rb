# frozen_string_literal: true

class ProponentContactsController < ApplicationController
  before_action :set_proponent
  before_action :set_contact, only: %i[show edit update destroy]

  # GET /proponents/:proponent_id/contacts
  def index
    @contacts = @proponent.contacts
  end

  # GET /proponents/:proponent_id/contacts/:id
  def show; end

  # GET /proponents/:proponent_id/contacts/new
  def new
    @contact = @proponent.contacts.new
  end

  # POST /proponents/:proponent_id/contacts
  def create
    @contact = @proponent.contacts.new(contact_params)

    if @contact.save
      redirect_to proponent_path(@proponent, tab: "contact"), notice: 'Contato foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /proponents/:proponent_id/contacts/:id/edit
  def edit; end

  # PATCH/PUT /proponents/:proponent_id/contacts/:id
  def update
    if @contact.update(contact_params)
      redirect_to  proponent_path(@proponent, tab: "contact"), notice: 'Contato foi atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /proponents/:proponent_id/contacts/:id
  def destroy
    @contact.destroy
    redirect_to  proponent_path(@proponent, tab: "contact"), notice: 'Contato foi excluído com sucesso.'
  end

  private

    def set_proponent
      @proponent = Proponent.find(params[:proponent_id])
    end

    def set_contact
      @contact = @proponent.contacts.find(params[:id])
    end

    def contact_params
      params.require(:proponent_contact).permit(:kind, :value)
    end
end
