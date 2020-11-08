class TravelListersController < ApplicationController 

    #CREATE

        #New

        get '/list/new' do
            erb :'/list/new'
        end
        

        #Create

        post '/list' do
            list = TravelLister.new(params)
            if list.description.strip != "" && list.save
                redirect to '/list'
            else 
                @error = "Error: Please enter in a valid description."
                erb :'/list/new'
            end
        end

    #READ
       
        #Index
        
        get '/list' do
            @lists = TravelLister.all.reverse
            erb :'/list/index'
        end

        #Show
        #make a get request to '/list/:id'

        get '/list/:id' do
            @lists = TravelLister.find_by_id(params[:id])
             erb :'/list/show'
        end

    #UPDATE

        #Edit
        #make a get request to '/list/:id/edit'

        #Update
        #make a patch request to '/list/:id'

    #DESTROY
        #make a delete request to '/list/:id'
end