class CategoriesController < ApplicationController
  def search
    @sizing = Category.find(params[:parent_id]).how_size
    @size = Size.where(sizing:@sizing)
    @children = Category.where(parent_id:params[:parent_id])
    respond_to do |format|
        format.html { redirect_to :root }
        format.json { render json: {categories:@children,size:@size} }
      end
  end
end