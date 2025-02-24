class SectionsController < ApplicationController
  def show
    @section = Section.find_by(id: params[:id])

    if @section.nil?
      raise ActiveRecord::RecordNotFound, "Section with ID #{params[:id]} not found"
    end

    @next_section = @section.survey.sections.where("position > ?", @section.position).first

    # Fetch previous responses for the current user (session-based tracking)
    @responses = Response.where(user_id: session[:user_id])
  end
end
