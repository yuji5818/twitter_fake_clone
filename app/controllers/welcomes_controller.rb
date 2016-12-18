class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:edit, :update, :destroy]

  def index
    @welcomes = Welcome.all   
  end
  
  def new
    if params[:back]
      @welcome = Welcome.new(welcomes_params)
    else  
      @welcome = Welcome.new
    end
  end
  
  def create
    @welcome = Welcome.new(welcomes_params)
      if @welcome.save
        redirect_to welcomes_path, notice: "新たにツイートしました！"
      else
        render 'new'
      end
  end
  
  def confirm
    @welcome = Welcome.new(welcomes_params) 
    render :new if @welcome.invalid? 
  end
  
  def edit
  end
  
  def update
    if @welcome.update(welcomes_params)
      redirect_to welcomes_path, notice:"ツイートを編集しました！"
    else
      render 'edit'
    end  
  end
  
  def destroy
    @welcome.destroy
    redirect_to welcomes_path, notice:"ツイートを削除しました！"
  end
  
  def set_welcome
     @welcome = Welcome.find(params[:id])
  end     
  
private
  def welcomes_params
    params.require(:welcome).permit(:content)
  end
  

  
end
