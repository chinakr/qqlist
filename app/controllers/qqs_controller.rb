class QqsController < ApplicationController
  before_action :set_qq, only: [:show, :edit, :update, :destroy, :move]

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

    if @qq.save
      @qq.note.create note_params
      redirect_to root_path, notice: "QQ号#{@qq.number}已添加。"
    else
      render action: 'new'
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
  def destroy
    #@qq.destroy
    @qq.status = '已删除'
    @qq.save
    redirect_to root_path, notice: "QQ号#{@qq.number}已删除。"
  end

  # POST /qqs/1/move
  def move
    list = List.find_by_name(params[:target])
    @qq.list = list
    @qq.save
    redirect_to root_path(qq: @qq.number)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_qq
      @qq = Qq.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def qq_params
      list = List.find_by_name(params[:list])
      { :number => params[:number], :list_id => list.id, :status => params[:status] }
      #params.require(:qq).permit(:number, :list_id, :status)
    end
    def note_params
      { :content => params[:note], :creator => session[:username] }
    end
end
