class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @qq = Qq.find(params[:qq_id])
    @note = Note.new(qq: @qq)
  end

  # GET /notes/1/edit
  def edit
    @qq = Qq.find(@note.qq_id)
  end

  # POST /notes
  def create
    @qq = Qq.find(params[:qq_id])
    @note = @qq.note.build(note_params)
    #@note = Note.new(note_params)

    if @note.save
      redirect_to root_path(qq: @qq.number), notice: "QQ号#{@qq.number}的说明添加成功。"
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /notes/1
  def update
    @qq = Qq.find(@note.qq_id)
    @note.content = note_params[:content]
    if @note.save
      redirect_to root_path(qq: @qq.number), notice: "QQ号#{@qq.number}的说明修改成功。"
    else
      render action: 'edit'
    end
  end

  # DELETE /notes/1
  def destroy
    @qq = Qq.find(@note.qq_id)
    @note.destroy
    redirect_to root_path(qq: @qq.number), notice: "QQ号#{@qq.number}的说明##{@note.id}已删除。"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:qq_id, :content, :creator)
    end
end
