class MunicipesController < ApplicationController
  before_action :load_municipe, only: %i[show edit update]

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
      redirect_to municipes_path, notice: I18n.t('flash.actions.create', resource: 'Munícipe')
    else
      flash[:error] = I18n.t('flash.errors.create', resource: 'Munícipe')
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @municipe.update(municipe_params)
      redirect_to municipes_path, notice: I18n.t('flash.actions.update', resource: 'Munícipe')
    else
      flash[:error] = I18n.t('flash.errors.update', resource: 'Munícipe')
      render :new
    end
  end

  private

  def load_municipe
    @municipe = Municipe.find(params[:id])
  end

  def municipe_params
    params.require(:municipe).permit(:name, :cpf, :cns, :email, :phone, :birth_date_string, :active, :photo,
                      address_attributes: [:street, :number, :complement, :neighborhood, :city, :state, :zip_code, :ibge_code])
  end
end
