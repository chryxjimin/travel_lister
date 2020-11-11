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

post '/list' do -- route that will create a new list item and make sure it is saved and there is no empty data entered, and it will redirect to '/list' if it is. Otherwise, it will display an error message that says ""Please enter in a valid description." and then redirect the user to erb :'/list/new'

get '/list/:id/edit' do -- route that will allow the user to edit the list item and be redirected to "/list/:id" with the updated entry. Any invalid data will show the user the error message with ""Error: Please enter in a valid description." and display the erb :'/list/edit' file. 

delete '/list/:id' do -- when the user views a particular list item there will be a delete request which will be rendered on the show.erb form and then redirect the user to the '/list' page.


# edit the erb files and use CSS to put the font for error message in red and style the page later and maybe categories and then add logos or images and maybe the buttons too and add links or functions that will improve user experience

# edit the show erb page to have links that can lead the user back to homepage if they don't want to delete the entry.


  user = User.create(username: params[:username], password: params[:password])
        if user.username.strip != "" && user.password.strip != ""
            user.save
            # session[:user_id] = user.id 
            erb :'/list/new'
        else 
            @error = "Username and password cannot be blank."
            erb :'/users/signup'
        end


