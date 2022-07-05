module ApplicationHelper
    #Custom Onglet Title
    def title
      base_title = "Lnclass Education"
      if @title.nil?
        base_title
      else
        "#{@title} | #{base_title}"
      end
    end
    #site description
    def description
        "Lnclass: facilité les études"
    end
end
