class BuzzwordsController < ApplicationController
  before_action :set_buzzword, only: [:show, :edit, :update, :destroy]

  # GET /buzzwords
  def index
    @buzzwords = Buzzword.all
  end

  # GET /buzzwords/1
  def show
  end

  # GET /buzzwords/new
  def new
    @buzzword = Buzzword.new
  end

  # GET /buzzwords/1/edit
  def edit
  end

  # POST /buzzwords
  def create
    @buzzword = Buzzword.new(buzzword_params)

    if @buzzword.save
      redirect_to buzzwords_path, notice: 'Buzzword was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /buzzwords/1
  def update
    if @buzzword.update(buzzword_params)
      redirect_to @buzzword, notice: 'Buzzword was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /buzzwords/1
  def destroy
    @buzzword.destroy
    redirect_to buzzwords_url, notice: 'Buzzword was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_buzzword
      @buzzword = Buzzword.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def buzzword_params
      params.require(:buzzword).permit(:word, :votes)
    end
end
