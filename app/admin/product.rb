ActiveAdmin.register Product do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :name, :description, :category_id, :price, :image, tag_ids: [] 
  
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :description
      f.input :category
      f.input :price
      f.input :tags
      f.input :image, :as => :file

    end
    f.actions
  end

  index do
    selectable_column
    column :id
    column :name
    column :description
    column :category_name
    column :price do |obj|
      "$#{number_with_precision(obj.price, :precision => 2, :delimiter => ',')}"  
    end
    column :tag do |obj|
      obj.tags.pluck(:title).join(', ')
    end
    column :image do |obj|
      image_tag(obj.image.url)
    end
    actions
  end
end
