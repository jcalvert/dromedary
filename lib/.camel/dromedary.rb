require 'java'
Dir.glob("**/*.jar").each{|jar| require jar }
Dir.glob("dromedary/*.rb").each{|rb| require rb}

