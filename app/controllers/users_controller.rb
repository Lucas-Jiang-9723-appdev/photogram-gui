class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc})
    render({:template => "user_templates/index.html.erb"})
  end

  def show
  url_username = params.fetch("path_username")

    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.at(0)
    if @the_user == nil
      redirect_to("/404")
    else
      render({:template => "user_templates/show.html.erb"})
    end
  end

  def add
    input_username = params.fetch("input_username")
    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save
    redirect_to("/users/"+a_new_user.username)
  end
  def update
    update_user = params.fetch("input_username")
    old_user = params.fetch("user_name")
    matching_user = User.where({:username => old_user})
    the_user = matching_user.at(0)
    the_user.username = update_user
    the_user.save
    redirect_to("/users/"+the_user.username)
  end
end
