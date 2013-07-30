class QqsController < ApplicationController
  before_action :set_qq, only: [:show, :edit, :update, :destroy]

  # GET /qqs
  # GET /qqs.json
  def index
    @qqs = Qq.all
  end

  # GET /qqs/1
  # GET /qqs/1.json
  def show
  end

  # GET /qqs/new
  def new
    @qq = Qq.new
  end

  # GET /qqs/1/edit
  def edit
  end

  # POST /qqs
  # POST /qqs.json
  def create
    @qq = Qq.new(qq_params)

    respond_to do |format|
      if @qq.save
        format.html { redirect_to @qq, notice: 'Qq was successfully created.' }
        format.json { render action: 'show', status: :created, location: @qq }
      else
        format.html { render action: 'new' }
        format.json { render json: @qq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /qqs/1
  # PATCH/PUT /qqs/1.json
  def update
    respond_to do |format|
      if @qq.update(qq_params)
        format.html { redirect_to @qq, notice: 'Qq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @qq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qqs/1
  # DELETE /qqs/1.json
  def destroy
    @qq.destroy
    respond_to do |format|
      format.html { redirect_to qqs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qq
      @qq = Qq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qq_params
      params.require(:qq).permit(:number, :list_id, :status)
    end
end
