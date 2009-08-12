# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_students_session',
  :secret      => '0f4afeda1bc8a42d8d020f8c85718f5a59bfde4b839b003d3fa0c6b7536b5e2f7244384050dcdf4d3f8fdd8c5a353d56fe03d7bae11091d877716a19456adf65'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
