# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - had the gem installed and had the ApplicationController inherit from Sinatra::Base
- [x] Use ActiveRecord for storing information in a database - I had the create_users.rb and create_lists.rb inherit from ActiveRecord.
- [x] Include more than one model class (e.g. User, Post, Category) - I created the User class and the List class. 
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many travel_essentials.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - Travel_essentials belongs_to user.
- [x] Include user accounts with unique login attribute (username or email) Created attribute for username in the create_users table and called the validates_presence_of :username method in the User model.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - I wrote code to make routes that involved the List class and that would create new list items, display them to the user, and allow the user to edit and delete the items.
- [x] Ensure that users can't modify content created by other users - I used the helper method to make sure only the current user could view their own list.
- [x] Include user input validations - the app only allows the user to sign in with the correct username and password.
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) - I had error messages appear to the user if the username already exists or if the user tries to login with an incorrect username or password.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - included all  of those in the README.md

Confirm
- [x] You have a large number of small Git commits - I commited as often as possible, especially when I got certain code to work.
- [x] Your commit messages are meaningful - I described which routes I changed and what I changed.
- [x] You made the changes in a commit that relate to the commit message - I made sure to commit if there were at least two lines of code of change.
- [x] You don't include changes in a commit that aren't related to the commit message - I only included what I had changed in the commits.