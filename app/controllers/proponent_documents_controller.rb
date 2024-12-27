# frozen_string_literal: true

class ProponentDocumentsController < ApplicationController
  before_action :set_proponent
  before_action :set_document, only: %i[show edit update destroy]

  # GET /proponents/:proponent_id/documents
  def index
    @documents = @proponent.documents
  end

  # GET /proponents/:proponent_id/documents/:id
  def show; end

  # GET /proponents/:proponent_id/documents/new
  def new
    @document = @proponent.documents.new
  end

  # POST /proponents/:proponent_id/documents
  def create
    puts "create document #{document_params} - #{@document}"
    @document = @proponent.documents.new(document_params)

    if @document.save
      redirect_to proponent_path(@proponent, tab: "document"), notice: 'Documento foi criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /proponents/:proponent_id/documents/:id/edit
  def edit; end

  # PATCH/PUT /proponents/:proponent_id/documents/:id
  def update
    if @document.update(document_params)
      puts "ok update doc"
      redirect_to  proponent_path(@proponent, tab: "document"), notice: 'Documento foi atualizado com sucesso.'
    else
      puts "error update doc"
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /proponents/:proponent_id/documents/:id
  def destroy
    @document.destroy
    redirect_to  proponent_path(@proponent, tab: "document"), notice: 'Documento foi excluído com sucesso.'
  end

  private

    def set_proponent
      @proponent = Proponent.find(params[:proponent_id])
      puts "proponent #{@proponent.inspect} - #{@proponent.documents.inspect}"
    end

    def set_document
      puts "set_document #{@proponent.inspect} - #{params[:id].inspect}"
      @document = @proponent.documents.find(params[:id])
      puts "set_document #{@proponent.inspect} - #{params[:id].inspect} - #{@document.inspect}"
    end

    def document_params
      params.require(:proponent_document).permit(:kind, :document)
    end
end
