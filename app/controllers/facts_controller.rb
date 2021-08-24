class FactsController < ApplicationController
before_action :initialize_client_object
    def index

        if search_params[:month] != nil && search_params[:day] != nil &&
                search_params[:month] != "" && search_params[:day] != ""
            @datefacts = @client.date_fact(search_params[:month], search_params[:day])
            
        end

        if search_params[:year] != nil && search_params[:year] != "" 
            @yearfacts = @client.year_fact(search_params[:year])
        end

        if search_params[:number] != nil && search_params[:number] != "" 
            @numberfacts = @client.number_fact(search_params[:number])
        end

        if search_params[:number] != nil && search_params[:number] != "" 
            @mathfacts = @client.math_fact(search_params[:number])
        end

        @randomfacts = @client.random_fact

    end


    private
    
    def initialize_client_object
        @client = Numbers::V1::Client.new
    end

    def search_params        
        params.permit(:year, :number, :month, :day)
    end 

end