class ListsController < ApplicationController
  def index
    matching_lists = List.all

    @list_of_lists = matching_lists.order({ :created_at => :desc })

    render({ :template => "lists/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_lists = List.where({ :id => the_id })

    @the_list = matching_lists.at(0)

    render({ :template => "lists/show.html.erb" })
  end

  def create_list
    render({ :template => "lists/create_lists.html.erb"})
  end

  def create
    the_list = List.new
    the_list.user_id = session[:user_id]
    #the_list.item_id = params.fetch("query_item_id")
    the_list.list_name = params.fetch("query_list_name")
    #the_list.date = params.fetch("query_date")
    #the_list.pantry_id = params.fetch("query_pantry_id")
    #the_list.items_count = params.fetch("query_items_count")

    if the_list.valid?
      the_list.save
      redirect_to("/lists", { :notice => "List created successfully." })
    else
      redirect_to("/lists", { :notice => "List failed to create successfully. Please enter a valid list name" })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.user_id = session[:user_id]
    #the_list.item_id = params.fetch("query_item_id")
    the_list.list_name = params.fetch("query_list_name")
    #the_list.date = params.fetch("query_date")
    #the_list.pantry_id = params.fetch("query_pantry_id")
    #the_list.items_count = params.fetch("query_items_count")

    if the_list.valid?
      the_list.save
      redirect_to("/lists/#{the_list.id}", { :notice => "List updated successfully."} )
    else
      redirect_to("/lists/#{the_list.id}", { :alert => "List failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_list = List.where({ :id => the_id }).at(0)

    the_list.destroy

    redirect_to("/lists", { :notice => "List deleted successfully."} )
  end

  def view
    the_id = params.fetch("path_id")

    matching_lists = List.where({ :id => the_id })

    @the_list = matching_lists.at(0)

    @list_item = Item.where({ :list_id => @the_list.id})

    render({ :template => "lists/view.html.erb"})
  end

  def view_list
    render({ :template => "lists/view_list.html.erb"})
  end
end
