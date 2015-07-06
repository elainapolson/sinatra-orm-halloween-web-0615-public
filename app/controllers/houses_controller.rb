require 'pry'
class HousesController < HalloweenController

  get '/houses' do
    @houses = House.all
    erb :'houses/index'
  end
  
  get '/houses/new' do 
    erb :'houses/new'
  end

  post '/houses' do 
    house = House.new(params[:house])
    house.save
    redirect to "http://example.org/houses/#{house.id}"
  end

  get '/houses/:id' do 
    @house = House.find(params[:id])
    @kids = Kid.all
    erb :'houses/show'
  end

  get '/houses/:id/edit' do 
    @house = House.find(params[:id]) 
    erb :'houses/edit'
  end

  patch '/houses/:id/trick-or-treat' do 
    # binding.pry
    kid = Kid.find(params[:kid_id].to_i)
    house = House.find(params[:id])
    house.give_candy(kid)

    redirect to "http://example.org/houses/#{house.id}"
  end

  patch '/houses/:id' do 
    house = House.find(params[:id])
    house.update(params[:house])
    house.save

    redirect to "http://example.org/houses/#{house.id}"
  end


end