class StockTypesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_stock_type, only: [:show, :edit, :update, :destroy]


  # GET /stock_types
  # GET /stock_types.json
  def index
    @stock_types = StockType.all
  end

  # GET /stock_types/1
  # GET /stock_types/1.json
  def show
  end

  # GET /stock_types/new
  def new
    @stock_type = StockType.new
  end

  # GET /stock_types/1/edit
  def edit
  end

  # POST /stock_types
  # POST /stock_types.json
  def create
    @stock_type = StockType.new(stock_type_params)
    respond_to do |format|
      if @stock_type.save
        format.html { redirect_to @stock_type, notice: 'Stock type was successfully created.' }
        format.json { render :show, status: :created, location: @stock_type }
      else
        format.html { render :new }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /stock_types/1
  # PATCH/PUT /stock_types/1.json
  def update
    respond_to do |format|
      if @stock_type.update(stock_type_params)
        format.html { redirect_to @stock_type, notice: 'Stock type was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_type }
      else
        format.html { render :edit }
        format.json { render json: @stock_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_types/1
  # DELETE /stock_types/1.json
  def destroy
    @stock_type.destroy
    respond_to do |format|
      format.html { redirect_to stock_types_url, notice: 'Stock type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_type
      @stock_type = StockType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_type_params
      params.require(:stock_type).permit(:name, :unit, :category, :base, :price, :base_stock_type_id, ingredients_attributes: [:id, :quantity, :stock_type_id, :stock_type_component_id, :_destroy])
    end
end

