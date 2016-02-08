require 'rubygems'
require 'bundler'

Bundler.require

Mongoid.load_configuration(
  {"clients"=>{"default"=>{"database"=>"replica_set", "hosts"=>["antoines-macbook-pro.local:27018", "antoines-macbook-pro.local:27019"], "options"=>{"replica_set"=>"rs1"}}}}
)

class MongoReplicatSet < Sinatra::Base
  get '/rs' do
    Mongoid.default_client.instance_variable_get("@cluster").servers.map(&:address).join(", ")
  end
end

run MongoReplicatSet