# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  file = Rails.root.join('.secret')
  if File.exist? file
    File.read(file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(file, token)
    token
  end
end
Paste::Application.config.secret_key_base = secure_token

