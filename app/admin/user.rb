ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :password, :password_confirmation, :test  
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "User Details" do
    f.input :email
    f.label(:test, 'Change Password')
    f.check_box(:test) unless f.object.new_record?
    f.input :password, :wrapper_html => {:style => f.object.new_record? ? '' : "display:none;"}, :required => false
    f.input :password_confirmation, :wrapper_html => {:style => f.object.new_record? ? '' : "display:none;"}, :required => false
    
    end
    f.actions
  end

  controller do
    before_action :update_params, only:[:update]

    def update_params
      if params[:user][:test].to_i == 0
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end


  end


end
