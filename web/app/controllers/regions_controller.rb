class RegionsController < ApplicationController
  include Pagy::Backend
  before_action :set_region, only: %i[show edit update destroy]

  def index
    count = 10
    @pagy, @regions = pagy(Region.all, items: count)
  end

  def search
    q = params[:q]

    regions = if q.present?
      Region.name_like(q)
    else
      []
    end

    @items = {}
    regions.map { |region| @items[region.id] = region.name }

    respond_to do |format|
      format.turbo_stream do
        render(
          turbo_stream: turbo_stream.update(
            "region_search_results",
            partial: "search_results",
            locals: {items: @items, q: q}
          )
        )
      end
    end
  end

  def show
  end

  def edit
  end

  def new
    @region = Region.new
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      redirect_to(show_region_path(@region), notice: "Region was successfully created.")
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  def update
    if @region.update(region_params)
      redirect_to(show_region_path(@region), notice: "Region was successfully updated.", status: :see_other)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  def destroy
    @region.destroy!
    redirect_to(index_region_path, notice: "Region was successfully destroyed.", status: :see_other)
  end

  private
  def region_id = params[:region_id]
  def set_region = @region = Region.find(region_id)
  def region_params = params.permit(:name)
end
