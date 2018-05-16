class ApplicationController < Sinatra::Base

  configure do
   set :views, "app/views"
   set :public_dir, "public"
 end

  get './' do
    erb :form
  end

  post '/student' do
    @student = Student.new(params[:student])

    params[:student][:courses].each do |details|
      Course.new(details)
    end

    @courses = Course.all

    erb :student
  end

end
