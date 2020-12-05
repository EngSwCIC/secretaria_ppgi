SimpleCov.start 'rails' do
  # any custom configs like groups and filters can be here at a central place
  enable_coverage :branch 
  add_filter "app/channels/application_cable/connection.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/mailers/application_mailer.rb"
  add_filter "app/channels/application_cable/channel.rb"
  add_filter "app/controllers/application_controller.rb"
  add_filter "app/controllers/home_controller.rb"



end
