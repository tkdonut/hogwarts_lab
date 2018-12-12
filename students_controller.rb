require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/' do
  @students = Student.all()
  erb(:index)
end
# show
get '/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# new

# create

# edit

# update

# destroy
