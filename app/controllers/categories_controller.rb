class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :show]
  layout 'dashboard'
  def index
    @categories = current_user.categories
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to root_path, notice: 'Category was successfully created.'
    else
      flash[:error] = @category.errors.full_messages
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to root_path, notice: 'Category was successfully updated.'
    else
      flash[:error] = @category.errors.full_messages
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to root_url, notice: 'Category was successfully destroyed.'
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit :name, :color, :limit
    end
end
