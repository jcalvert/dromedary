class DromedaryRouteDefinition < org.apache.camel.model.RouteDefinition
  
  def initialize(input)
      super input
  end
  
end

#  if input.is_a? org.apache.camel.model.RouteDefinition
 #   @inner_definition = input
#    super ''
#  else
 #   p 'undfine'