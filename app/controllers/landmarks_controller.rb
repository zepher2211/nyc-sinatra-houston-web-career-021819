class LandmarksController < ApplicationController
  set(:views, "app/views/landmarks")
  #Create
  get '/landmarks/new' do
      erb :new
  end
  post '/landmarks' do
      Landmark.create(params[:landmark])
  end

  #Read

  get '/landmarks' do
      @landmarks = Landmark.all
      erb :index
  end

  get '/landmarks/:id' do
       @landmark = Landmark.find(params[:id])
       erb :show
   end


  #Update
  get '/landmarks/:id/edit' do
       @landmark = Landmark.find(params[:id])
       erb :edit
   end
   patch '/landmarks/:id' do
           @landmark = Landmark.find(params[:id])
           @landmark.update(params[:landmark])
           redirect "/landmarks/#{@landmark.id}"
   end


  #Delete
end
