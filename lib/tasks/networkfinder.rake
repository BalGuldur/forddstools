require File.expand_path(File.dirname(__FILE__) + "/../../config/environment")

namespace :net do
  desc "No deamon, run once. Ping's all ip in all networks in table networks, and create online's ip"
  task(:finder => :environment) do
    netchecker=Checknets.new
    netchecker.allfindandcreate
  end
end
      
