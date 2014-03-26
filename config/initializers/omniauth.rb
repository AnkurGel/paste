credentials = YAML.load_file("#{Rails.root}/secret_credentials.yaml")
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, credentials['key'], credentials['secret'], scope: "user,repo,gist"
end
