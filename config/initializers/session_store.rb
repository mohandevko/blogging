# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_blog_session',
  :secret      => '2c279573d51c5394fb3c3b997c9a2a3388f7b246dbfbe8c291d784f7f1752379e9ad87918073a1db8eaf9079adeb8b17df600c960341344a72656a8f267cc7a4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
