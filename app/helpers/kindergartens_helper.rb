module KindergartensHelper
    def render_kindergarten_status(kindergarten)
      if kindergarten.is_hidden
        content_tag(:span, "", :class => "fa fa-lock")
      else
        content_tag(:span, "", :class => "fa fa-globe")
      end
    end
end
