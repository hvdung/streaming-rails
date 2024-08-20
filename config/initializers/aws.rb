# config/initializers/aws.rb
Aws.config.update({
  region: ENV['AWS_REGION'], # Thay đổi theo khu vực của bạn
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
})
