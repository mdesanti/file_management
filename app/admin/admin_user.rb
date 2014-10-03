ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
 
  menu :label => "Usuarios"   
  
  breadcrumb do
      params[:action]=='index' ? [] : []
  end
  
  action_item :only => :show do
      link_to "Volver", admin_admin_users_path
  end
    
  index :title => 'Usuarios' do
    selectable_column
    #id_column
    column :email
    column 'Logeado Desde', :current_sign_in_at
    column 'Cantidad de Logeos', :sign_in_count
    column 'Creado el', :created_at
    actions
  end
  
   
  filter :email
  filter :current_sign_in_at, :label => 'Logeado Desde'
  filter :sign_in_count, :label => 'Cantidad de Logeos'
  filter :created_at, :label => 'Creado el'

  controller do
    def edit
        @page_title = 'Editar Usuarios'
    end
   end
   
   form do |f|
      f.inputs "Detalles" do
      f.input :email
      f.input :password
      f.input :password_confirmation, :label => 'Confirmación de Password'
    end
    f.actions
  end

  show :title => :email do
    panel 'Detalles' do
      attributes_table_for admin_user do
        row :email, :label => 'Sandra'
        row 'Cantidad de Logeos' do
          admin_user.sign_in_count
        end
        row 'Este Logeo' do
          admin_user.current_sign_in_at
        end
        row 'Último Logeo' do
          admin_user.last_sign_in_at
        end
        row 'Creado el' do
          admin_user.created_at
        end
        row 'Actualizado el' do
            admin_user.updated_at
        end
      end
    end
  end
end
