require 'pry'
class KidsController < HalloweenController

  get '/kids/new' do 
    erb :'kids/new'
  end

  get '/kids' do 
    @kids = Kid.all
    erb :'kids/index'
  end

  get '/kids/:id' do 
    @kid = Kid.find(params[:id])
    erb :'kids/show'
  end

  get '/kids/new' do 
    erb :'kids/new'
  end 

  patch '/kids/:id/pig-out' do 
    @kid = Kid.find(params[:id])
    @kid.pig_out(params[:consumption].to_i)
    redirect to "/kids/#{@kid.id}"
  end

  post '/kids' do 
    @kid = Kid.new(params[:kid])
    @kid.save
    redirect to "/kids/#{@kid.id}"
  end

end