require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')
require('pry')

get '/' do
redirect to '/students'
end
# index
get '/students' do
  @students = Student.all()
  erb(:index)
end
# new
get '/students/new' do
  @houses = House.all
  erb(:new)
end
# show
get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post '/students' do
  @student = Student.new(params)
  @student.save
  redirect to '/students'
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  @houses = House.all
  erb(:edit)
end
# update
post '/students/:id/edit' do
    @student = Student.new(params)
    @student.update()
    redirect to '/students'
end

get '/students/:id/delete' do
  @student = Student.new(params)
  @student.delete
  redirect to '/students'
end
