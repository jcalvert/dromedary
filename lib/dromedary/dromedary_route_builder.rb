class DromedaryRouteBuilder < org.apache.camel.builder.RouteBuilder
 
  def initialize(input)
    if input.kind_of? org.apache.camel.CamelContext
      super input
    else
      super()
      @input = input.scan(/[a-z]+\s\'.*?\'/).collect{|i| i.split ' '} #TODO: This is naive and would allow spaces in URIs obviously, also, error/format handling
    end 
  end
    
  java_signature 'void configure()'
  def configure
    entryslice = @input.slice! 0
    entrypoint = self.send entryslice[0].to_sym, strip_quotes(entryslice[1])
    @input.reduce(entrypoint){|entrypoint, operation| 
      p operation[0], operation[1], 'har'
      entrypoint.send operation[0].to_sym, strip_quotes(operation[1]) }
  end 
  
  protected
    def strip_quotes(input)
      input.chomp('\'').reverse.chomp('\'').reverse
    end
  
end