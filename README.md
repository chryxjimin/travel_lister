#TODO
create migrations
create models with relationships
plan out routes for controller following restful conventions
 and map to CRUD actions build controller actions and views simultaneously -->

get '/' do  --  (index.erb) - welcome page, there should be a link for ('/signup') and ('/login')
get '/signup' do -- (signup.erb) - form to have user sign up with a username and password. Needs to have action for '/signup' and method for 'post'
post '/signup' do -- creates user and saves it and shows the list, otherwise it redirects to '/login'


get '/login' do -- (login.erb) form that allows the user to sign in with a username and password
post '/login' do -- if user is logged in, you will need to add session to the hash and redirect to the user's page showing all the travel essentials(list.erb)






