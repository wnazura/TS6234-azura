# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mphonline_session',
  :secret      => '9499d8716c7a8404599d7ac4def62e3cb81c88d6143ebd615a1f867a7198ba525bf97ad8f98e8a2dd5723c3908d4c501ae8908c4e10ef61b63dac5f06e1699dc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
