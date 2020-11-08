#TODO
create migrations
create models with relationships
plan out routes for controller following restful conventions
 and map to CRUD actions build controller actions and views simultaneously -->

get '/' do  --  (index.erb) - welcome page, there should be a link for ('/signup') and ('/login')
get '/signup' do -- (signup.erb) - it will create a route that will open up a form to have user sign up with a username and password. Needs to have action for '/signup' and method for 'post'
post '/signup' do -- route that creates user and saves it and shows the list, otherwise it redirects to '/login'


<!-- get '/login' do -- (login.erb) route that shows a form that allows the user to sign in with a username and password
post '/login' do -- route that will , if user is logged in, will need to add session to the hash and redirect to the user's page showing all the items on the user's list -->

get '/list/:id' do -- route that will find the list based on the user's id and will show only the user's travel list using the show.erb file

get '/list/new/' do -- route that will show a form that will let users add items to their list, using the new.erb file that will have the post method and action to '/list'

post '/list' do -- route that will create a new list item and make sure it is saved and there is no empty data entered, and it will redirect to '/list' if it is. Otherwise, it will display an error message that says ""Please enter in a valid description." and then redirect the user to '/list/new'




# edit the erb files and use CSS to put the font for error message in red and style the page later and maybe the buttons too






