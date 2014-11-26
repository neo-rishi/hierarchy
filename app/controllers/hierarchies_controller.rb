class HierarchiesController < ApplicationController

  # Get all family member data of current user
  def index
    @hierarchies = current_user.hierarchies.order('parent_id')
  end


  # Request for new record
  def new
    @hierarchy = Hierarchy.new
  end

  # Create new family member record
  def create
    @hierarchy = current_user.hierarchies.build(hierarchy_params)

    respond_to do |format|
      if @hierarchy.save
        format.html { redirect_to hierarchies_path, notice: 'Hierarchy was successfully created.' }
      else
        format.html { redirect_to new_hierarchy_path, alert: 'This parent child already exists give another name for child....' }
        format.json { render json: @hierarchy.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def hierarchy_params
      params.require(:hierarchy).permit(:name, :parent_id)
    end
end
