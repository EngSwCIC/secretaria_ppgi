class RequirementsController < ApplicationController
  # GET /requirements
  # GET /requirements.json
  def index
    @requirements = Requirement.all
  end

  # GET /requirements/new
  def new
    @requirements = Requirement.all
    
    @requirement = Requirement.new
  end

  # POST /requirements
  # POST /requirements.json
  def create
    requirements = Requirement.all
  
    @requirement = Requirement.new(requirement_params)

    respond_to do |format|
      if @requirement.save
        # Delete previous requirements. 
        requirements.each do |requirement|
          if requirement != @requirement
            requirement.destroy!
          end
        end

        format.html { redirect_to '/requirements', notice: 'Requisitos criados com sucesso' }
        format.json { render :show, status: :created, location: @requirement }
      else
        format.html { render :new }
        format.json { render json: @requirement.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def requirement_params
      params.require(:requirement).permit(:requirements)
    end
end
