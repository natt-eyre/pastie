class PastesController < ApplicationController
  before_filter :require_login

  def new
    @paste = Paste.new
  end

  def create
    @paste = Paste.new(paste_params)
    if @paste.save
      redirect_to @paste
    else
      render :new
    end
  end

  def show
    @paste = Paste.find(params[:id])
  end

  private

  def paste_params
    params.require(:paste).permit(:name, :contents)
  end

end
