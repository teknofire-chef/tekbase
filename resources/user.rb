property :sudo, [TrueClass, FalseClass], default: false

action :create do
  user new_resource.name do
    manage_home true
    shell '/bin/bash'
    action [:create, :manage]
  end

  sudo 'admin' do
    user new_resource.name
    nopasswd true
    action new_resource.sudo ? :create : :delete
  end
end
