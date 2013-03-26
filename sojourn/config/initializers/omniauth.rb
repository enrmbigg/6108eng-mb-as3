OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '119518098236435', '6ffe8dbbea4450ef4aa468d734e3ea87',:display => "popup"
end