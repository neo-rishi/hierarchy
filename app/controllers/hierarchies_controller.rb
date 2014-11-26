class HierarchiesController < ApplicationController

  def index
    @hierarchies = current_user.hierarchies.order('parent_id')
  end


  # GET /hierarchies/new
  def new
    @hierarchy = Hierarchy.new
  end

  def create
    @hierarchy = current_user.hierarchies.build(hierarchy_params)

    respond_to do |format|
      if @hierarchy.save
        format.html { redirect_to hierarchies_path, notice: 'Hierarchy was successfully created.' }
      else
        format.html { render :new }
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
