class QuestionsController < ApplicationController
  def new
    @section = Section.find(params[:section_id])
    @question = @section.questions.build
  end

  def create
    @section = Section.find(params[:section_id])
    @question = @section.questions.build(question_params)
    if @question.save
      redirect_to section_path(@section), notice: "Question added successfully!"
    else
      render :new
    end
  end

  private

  def question_params
    params.require(:question).permit(:content, :question_type, options_attributes: [ :content ])
  end
end
