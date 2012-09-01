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
    @user = @question.user
    if current_user==@user
      @answers = @question.answers.where("available = 1")
    else
      @answers = @question.answers
    end
  end

  def update
    @question = Question.find(params[:id])
    @user = current_user
    @answers = @question.answers.where("available = 0").slice(0,3)
    @score = @user.score-10
    @user.update_attribute(:score, @score)
    sign_in @user
    @answers.each do |a| 
     a.update_attribute(:available, 1) 
    end
    redirect_to user_question_path(@user, @question)
  end

  def destroy
  end
end