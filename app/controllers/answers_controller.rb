class AnswersController < ApplicationController
  before_filter :signed_in_user

  	def new
  		@question = Question.find(params[:question_id])
  		@user = User.find(params[:user_id])
  		@answer = @question.answers.build
  	end

	def create
		@question = Question.find(params[:question_id])
		@user = User.find(params[:user_id])
		@cuser = current_user
		if @question.level==1
			@score = @cuser.score+10
		elsif @question.level==2
			@score = @cuser.score+20
		else
			@score = @cuser.score+30
		end
		@answer = @question.answers.build(params[:answer])
		if @answer.save
			@mensaje = "Usted ahora tiene #{@score} puntos."
			flash[:success] = @mensaje
			@cuser.update_attribute(:score, @score) 
			sign_in @cuser
			redirect_to user_question_path(@user, @question)
		else
			render root_path
		end
	end

	def destroy
	end

	def update
  		@answer = Answer.find(params[:id])
  		@user = User.find(params[:user_id])
  		@question = Question.find(params[:question_id])
  		if @answer.update_attributes(params[:answer])
  			flash[:success] = "Calificada!"
      		redirect_to user_question_path(@user, @question)
      	else
      		redirect_to edit_user_question_answer_path(@user, @question, @answer)
      	end
  	end

  	def edit
  		@user = User.find(params[:user_id])
  		@question = Question.find(params[:question_id])
  		@answer = Answer.find(params[:id])
  		@writer = @answer.writer
  		@comments = @answer.comments
  	end

end
