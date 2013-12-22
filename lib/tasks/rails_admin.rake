Rake.application.instance_variable_get('@tasks').delete('rails_admin:disable_initializer')
namespace :rails_admin do
  task :disable_initializer do
    ENV['SKIP_RAILS_ADMIN_INITIALIZER'] = 'true'
  end
end
