Rails.application.routes.draw do

  get("/", { :controller => "application", :action => "index"})

  # Routes for the Pantry resource:

  # CREATE
  post("/insert_pantry", { :controller => "pantries", :action => "create" })
          
  # READ
  get("/pantries", { :controller => "pantries", :action => "index" })
  
  get("/pantries/:path_id", { :controller => "pantries", :action => "show" })
  
  # UPDATE
  
  post("/modify_pantry/:path_id", { :controller => "pantries", :action => "update" })
  
  # DELETE
  get("/delete_pantry/:path_id", { :controller => "pantries", :action => "destroy" })

  #------------------------------

  # Routes for the Item resource:

  # CREATE
  post("/insert_item", { :controller => "items", :action => "create" })
          
  # READ
  get("/items", { :controller => "items", :action => "index" })
  
  get("/items/:path_id", { :controller => "items", :action => "show" })
  
  # UPDATE
  
  post("/modify_item/:path_id", { :controller => "items", :action => "update" })
  
  # DELETE
  get("/delete_item/:path_id", { :controller => "items", :action => "destroy" })

  #------------------------------

  # Routes for the List resource:

  # CREATE
  get("/create_list", { :controller => "lists", :action => "create_list" })
  post("/insert_list", { :controller => "lists", :action => "create" })
          
  # READ
  get("/lists", { :controller => "lists", :action => "index" })
  
  get("/lists/:path_id", { :controller => "lists", :action => "show" })

  get("/view_lists/:path_id", { :controller => "lists", :action => "view" })
  
  # UPDATE
  
  post("/modify_list/:path_id", { :controller => "lists", :action => "update" })
  
  # DELETE
  get("/delete_list/:path_id", { :controller => "lists", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
