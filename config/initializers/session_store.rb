# Be sure to restart your server when you modify this file.

<<<<<<< HEAD
Sandbox::Application.config.session_store :cookie_store, :key => '_sandbox_session'
=======
SandboxApp::Application.config.session_store :cookie_store, :key => '_sandbox-app_session'
>>>>>>> 4313f4632b7fea070ea5b3ede8b1df760b0fe831

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
<<<<<<< HEAD
# Sandbox::Application.config.session_store :active_record_store
=======
# SandboxApp::Application.config.session_store :active_record_store
>>>>>>> 4313f4632b7fea070ea5b3ede8b1df760b0fe831
