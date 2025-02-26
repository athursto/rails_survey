class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
    session[:user_id] ||= SecureRandom.random_number(1000)# Assign unique user ID
    @first_section = @survey.sections.first

    if @first_section.nil?
      flash[:alert] = "No sections available for this survey."
      redirect_to surveys_path
    end
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey
    else
      render :new
    end
  end

  def completion
    @survey = Survey.find(params[:survey_id])
    @user = User.find_by(id: session[:user_id])
  end

  def submit_email
    @survey = Survey.find(params[:survey_id])
    @user = User.find_by(id: session[:user_id])

    if @user.update(email: params[:email])
      flash[:notice] = "Thank you! You will receive an email shortly."
      # TODO not actually sending emails yet-- can do that with https://guides.rubyonrails.org/action_mailer_basics.html
      redirect_to root_path
    else
      flash[:alert] = "Error submitting your email."
      render :completion
    end
  end
  private

  def survey_params
    params.require(:survey).permit(:title)
  end
end
