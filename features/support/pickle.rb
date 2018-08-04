# this file generated by script/generate pickle [paths] [email]
#
# Make sure that you are loading your factory of choice in your
# cucumber environment
#
# For machinist add: features/support/machinist.rb
#
#    # or your chosen adaptor
#    require 'machinist/active_record'
#
#    # or wherever your blueprints are
#    require File.dirname(__FILE__) + '/../../spec/blueprints'
#
# For FactoryBot add: features/support/factory_bot.rb
#
#    require 'factory_bot'
#
#    # or wherever your factories are
#    require File.dirname(__FILE__) + '/../../spec/factories'
#
# For Fabrication, just include it in the adapter list when configuring
# pickle as explained below.
#
# You may also need to add gem dependencies on your factory of choice
# in <tt>config/environments/cucumber.rb</tt>

require 'pickle/world'
# Example of configuring pickle:
#
# Pickle.configure do |config|
#   config.adapters = [:machinist]
#   config.map 'I', 'myself', 'me', 'my', :to => 'user: "me"'
# end
require 'pickle/path/world'
require 'pickle/email/world'