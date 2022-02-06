class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  # se o usuário não estiver logado, nenhuma ação é permitida, exceto index e show
  before_action :authenticate_user!, except: [:index, :show]
  # antes de executar as funções, verificar se o usuário tem as devidas permissões, mas apenas para edit,
  # update e destroy
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    # @character = Character.new
    #criando personagem associado ao usuário atual
    @character = current_user.characters.build
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    #@character = Character.new(character_params)
    @character = current_user.characters.build(character_params)
    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  # quando o usuário tentar editar um personagem, verificar se ele tem permissão
  def correct_user
    @character = current_user.characters.find_by(id: params[:id])
    redirect_to characters_path, notice: "Not Authorized to edit this character - Sucker!" if @character.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    #parâmetros são as propriedades da classe
    def character_params
      params.require(:character).permit(:first_name, :last_name, :origin, :user_id)
    end
end
