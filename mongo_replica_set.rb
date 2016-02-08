Mongoid.load_configuration(
  {"clients"=>{"default"=>{"database"=>"replica_set", "hosts"=>["Antoines-MacBook-Pro.local:27018"], "options"=>{"replica_set"=>"rs1"}}}}
)

class MongoReplicatSet< Sinatra::Base
  get '/rs' do
    Mongoid.default_client.instance_variable_get("@cluster").servers.map(&:address).join(", ")
  end
end

