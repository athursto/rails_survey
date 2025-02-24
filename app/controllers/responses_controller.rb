class ResponsesController < ApplicationController
  def create
    user_id = find_or_create_user_id
    #
    # Rails.logger.debug "Raw Params: #{params[:responses].inspect}"
    # Rails.logger.debug "Received responses params: #{responses_params.inspect}"
    responses_params.each do |question_id, response_data|
      question = Question.find(question_id)
      next if question.info? # Skip info box questions
      Response.create!(
        question_id: question_id.to_i, #Making sure question id is an integer
        user_id: user_id, # Now using an integer user ID
        answer: response_data["answer"].to_s.strip.downcase
      )
      # Rails.logger.debug "Created Response: #{response.inspect}"
    end

    next_section = determine_next_section
    if next_section
      redirect_to survey_section_path(params[:survey_id], next_section), notice: 'Proceed to next section.'
    else
      redirect_to survey_completion_path(params[:survey_id]), notice: 'Survey completed! Enter your email for a gift card.'
    end
  rescue ActiveRecord::RecordInvalid => e
    redirect_back fallback_location: root_path, alert: "Error submitting responses: #{e.message}"
  end

  end
  private

  def responses_params
    params.require(:responses).permit!
  end

def determine_next_section
  last_answered_question_id = responses_params.keys.last
  last_answer_data = responses_params[last_answered_question_id]

  # Ensure we extract the actual answer string
  last_answer = last_answer_data["answer"].to_s.strip.downcase

  Rails.logger.debug "Last Answered Question ID: #{last_answered_question_id}"
  Rails.logger.debug "Extracted Last Answer: '#{last_answer}'"

  last_answered_question = Question.find(last_answered_question_id)

  branching_rule = last_answered_question.branching_rules.find do |rule|
    rule.answer.strip.casecmp?(last_answer.strip)
  end

  next_section = branching_rule&.next_section || last_answered_question.section.survey.sections.where("position > ?", last_answered_question.section.position).first


  next_section
end


def find_or_create_user_id
  if session[:user_id] && User.exists?(session[:user_id])
    return session[:user_id]
  else
    user = User.create
    session[:user_id] = user.id
    return user.id
  end
end


