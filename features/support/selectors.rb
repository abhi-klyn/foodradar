# Source: https://makandracards.com/makandra/31145-an-auto-mapper-for-bem-classes-in-cucumber-selectors

module HtmlSelectorsHelpers
    def selector_for(locator)
      case locator
  
      # Auto-mapper for BEM classes
      #
      # Usage examples:
      #   the main menu -> '.main-menu'
      #   the item box's header -> '.item-box--header'
      #   the slider's item that is current -> '.slider--item.is-current'
      when /^the (.+?)(?:'s (.+?)(?: that (.+))?)?$/
        selector = '.'
        selector << selectorify($1)
        selector << '--' << selectorify($2) if $2
        selector << '.' << selectorify($3) if $3
        selector
      
      else
        raise "Can't find mapping from \"#{locator}\" to a selector.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
    
    private
  
    def selectorify(string)
      string.gsub(/ /, '-')
    end
  
  end
  
  World(HtmlSelectorsHelpers)