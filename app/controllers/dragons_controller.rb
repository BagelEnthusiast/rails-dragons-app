class DragonsController < ApplicationController
  
  before_action :current_dragon, except: [:index, :new, :create]

  def index
    @dragons = Dragon.all
  end

  def show
    
  end

  def new
    @dragon = Dragon.new
    @users = User.all
  end

  def create
    @dragon = Dragon.new(dragon_params)

    if @dragon.valid?
      @dragon.save
      redirect_to @dragon
    else
      flash[:error] = @dragon.errors.full_messages
      redirect_to new_dragon_path
    end
  end

  def edit
    @users = User.all
  end

  def update
    @dragon_temp = @dragon
    @dragon.update(dragon_params)
    if @dragon.valid?
      redirect_to @dragon
    else
      @dragon = @dragon_temp
      @dragon.save
      flash[:error] = @dragon.errors.full_messages
      redirect_to edit_dragon_path(@dragon)
    end

  end

 

  def destroy
  end

  private

  def current_dragon
    @dragon = Dragon.find(params[:id])
  end

  def dragon_params
    params.require(:dragon).permit(:name, :age, :user_id)
  end



end
