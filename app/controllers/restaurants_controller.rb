class RestaurantsController < ApplicationController
    def index
      @restaurants = Restaurant.all
  
      render json: @restaurants
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
    
        if @restaurant.save
          render json: @restaurant, status: :created
        else
          render json: @restaurant.errors, status: :unprocessable_entity
        end
      end
    
      private
    
      def restaurant_params
        params.require(:restaurant).permit(:name, :address)
      end

    def show
        @restaurant = Restaurant.find(params[:id])
    
        if @restaurant
          render json: @restaurant
        else
          render json: { error: "Restaurant not found" }, status: 404
        end
      end
      def destroy
        @restaurant = Restaurant.find(params[:id])
    
        if @restaurant
          @restaurant_pizzas = @restaurant.restaurant_pizzas
    
          @restaurant_pizzas.each do |restaurant_pizza|
            restaurant_pizza.destroy
          end
    
          @restaurant.destroy
    
          head 204
        else
          render json: { error: "Restaurant not found" }, status: 404
        end
      end
    
  end