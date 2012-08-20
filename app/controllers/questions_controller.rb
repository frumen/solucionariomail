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
  end

  def destroy
  end
end