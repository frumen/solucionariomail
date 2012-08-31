class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :index]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def show
  	@user = User.find(params[:id])
    @top5 = User.find(:all, order: :score).reverse.slice(0,5)
    @questions = @user.questions.paginate(page: params[:page])
    @areas = @user.areas
  end

  def new
  	@user = User.new
    (Area.all - @user.areas).each do |area|
    @user.area_users.build( area_id: area.id )
    end
    @user.area_users.sort_by! { |x| x.area.name }
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    (Area.all - @user.areas).each do |area|
      @user.area_users.build( area_id: area.id )
    end
    @user.area_users.sort_by! { |x| x.area.name }
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Datos Cambiados."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  def top5
    @users = User.find(:all, order: :name, limit: 5)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Usuario Eliminado"
    redirect_to users_path
  end

  def premiar
    @score = self.score+10
    self.update_attribute(:score, @score) 
  end

  private

  def correct_user
    @user=User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

end
