class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("path_photo")
    matching_photos = Photo.where({:id=>url_id})
    @the_photo = matching_photos.first
    render({:template => "photo_templates/show.html.erb"})
  end

  def delete
    delete_id = params.fetch("delete_id")
    matching_photos = Photo.where({:id => delete_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    # render({:template => "photo_templates/delete.html.erb"})
    redirect_to("/photos")
  end

  def add
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id
    a_new_photo.save
    redirect_to("/photos/"+a_new_photo.id.to_s)
  end
  def update
    photo_id = params.fetch("photo_id")
    update_url = params.fetch("input_image")
    update_caption = params.fetch("input_caption")
    matching_photo = Photo.where({:id => photo_id})
    the_photo = matching_photo.at(0)
    the_photo.image = update_url
    the_photo.caption = update_caption
    the_photo.save
    redirect_to("/photos/"+the_photo.id.to_s)
  end
  def add_comment
    photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    new_comment = params.fetch("input_body")
    a_new_comment = Comment.new
    a_new_comment.body = new_comment
    a_new_comment.author_id = author_id
    a_new_comment.photo_id = photo_id
    a_new_comment.save
    redirect_to("/photos/"+photo_id.to_s)
  end
end
