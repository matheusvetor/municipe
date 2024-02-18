class MunicipesController < ApplicationController
  def index
    @pagy, @municipes = pagy(Municipe.all)
  end

  def new
    @municipe = Municipe.new
    @address = @municipe.build_address
  end

  def create
    @municipe = Municipe.new(municipe_params)

    if @municipe.save
      redirect_to municipes_path, notice: 'Munícipe criado com sucesso.'
    else
      flash[:error] = 'Erro ao criar o Munícipe.'
      render :new
    end
  end

  def edit
    @municipe = Municipe.find(params[:id])
  end

  def show
    @municipe = Municipe.find(params[:id])
  end

  def update
    @municipe = Municipe.find(params[:id])

    if @municipe.update(municipe_params)
      redirect_to municipes_path, notice: 'Munícipe atualizado com sucesso.'
    else
      flash[:error] = 'Erro ao atualizar o Munícipe.'
      render :new
    end
  end

  private

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :phone, :birth_date_string, :active, :photo,
                      address_attributes: [:street, :number, :complement, :neighborhood, :city, :state, :zip_code, :ibge_code])
  end
end
