require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')
require('pry')

# index
get '/' do
  @students = Student.all()
  erb(:index)
end
# new
get '/new' do
  # @houses = House.all
  erb(:new)
end
# show
get '/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# create
post '/' do
  @student = Student.new(params)
  @student.save
  redirect to '/'
end

# edit
get '/edit/:id' do
  @student = Student.find(params[:id])
  erb(:edit)
end
# update
post '/edit/:id' do
    @student = Student.new(params)
    @student.update()
    redirect to '/'
end


# destroy
