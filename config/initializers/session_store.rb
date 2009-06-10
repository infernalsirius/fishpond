# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fishpond_session',
  :secret      => '65efd1507a854d5083ba5b199b1f0443e80db416ab85223e87f043b0ff6d3581bb30dd5fc657e7f4cb3e76e8b0aeabb95bf0763d5311da96179c69d8f576d8b3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
