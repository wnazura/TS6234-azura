# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_jmbariani_session',
  :secret      => '3c6ed7ecf60ef639c3687146367fc63a8c388e9b48cead1c8bcb754e82777821dcbf0ff9e91d11ed617c3f053e4af7c52655ebeac317ab8648311a27b3cdc0a9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
