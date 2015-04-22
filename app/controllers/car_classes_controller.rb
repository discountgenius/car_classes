class CarClassesController < ApplicationController
  before_action :signed_in_user
  before_action :set_car_class, only: [:show, :edit, :update, :destroy, :merge, :do_merge]

  respond_to :html

  def index
    @car_classes = CarClass.sorted
    respond_with(@car_classes)
  end

  def show
    respond_with(@car_class)
  end

  def new
    @car_class = CarClass.new
    respond_with(@car_class)
  end

  def edit
  end

  def create
    @car_class = CarClass.new(car_class_params)
    @car_class.save
    respond_with(@car_class)
  end

  def update
    @car_class.update(car_class_params)
    respond_with(@car_class)
  end

  def destroy
    @car_class.destroy
    respond_with(@car_class)
  end

  def merge
    @other_options = CarClass.where.not(id: @car_class.id).sorted
  end

  def do_merge
    other = CarClass.find(params[:other_id])
    new_name = params[:new_name]
    @car_class.merge(other, new_name)
    respond_with(@car_class)
  end

  private
    def set_car_class
      @car_class = CarClass.find(params[:id])
    end

    def car_class_params
      params.require(:car_class).permit(:name)
    end
end
