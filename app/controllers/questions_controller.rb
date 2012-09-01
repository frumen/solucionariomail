class QuestionsController < ApplicationController
  before_filter :signed_in_user

  def new
  	@question = current_user.questions.build
  end

  def create
  	@question = current_user.questions.build(params[:question])
  	if @question.save
  		flash[:success] = "Pregunta realizada!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.where("available = 1")
    @user = @question.user
  end

  def update
    @question = Question.find(params[:id])
    @user = current_user
    @answers = @question.answers.where("available = 0").slice(0,3)
    #AHORA HAY QUE HACER DISPONIBLES LAS @ANS Y SACAR PUNTOS AL @USR
  end

  def destroy
  end
end