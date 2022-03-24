module Api
  module V1
    class GreetingsController < ApplicationController
      def index
        @greetings = Greeting.all 
        render json: @greetings
      end 

      def show
          @greeting = Greeting.find(params[:id])
          render json: @greeting
      end 

    end
  end
end