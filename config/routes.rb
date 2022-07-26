Rails.application.routes.draw do

  get("/users", {:controller => "users", :action => "index"})
  get("/users/:path_username", {:controller => "users", :action => "show"})
  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:path_photo", {:controller => "photos", :action => "show"})
  get("/delete_photo/:delete_id", {:controller => "photos", :action => "delete"})
  get("/", {:controller => "users", :action => "index"})
  get("/insert_photo_record", {:controller => "photos", :action => "add"})
  get("/insert_user_record", {:controller => "users", :action => "add"})
  get("/update_user/:user_name", {:controller => "users", :action => "update"})
  get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})
  get("/insert_comment_record", {:controller => "photos", :action => "add_comment"})


end
