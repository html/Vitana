# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_vitana_session',
  :secret      => '93667189d457ee565fb19aa670ee59936b75c691a56a8f08ab5349e9ab21e9c10937892fe146be986f1a5903db977b07c250877253ff41e58f45c9b4ef48f585'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
