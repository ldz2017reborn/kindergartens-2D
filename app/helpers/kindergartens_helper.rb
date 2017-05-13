module KindergartensHelper
    def render_kindergarten_status(kindergarten)
      if kindergarten.is_hidden
        content_tag(:span, "", :class => "fa fa-lock")
      else
        content_tag(:span, "", :class => "fa fa-globe")
      end
    end

    def render_highlight_content(kindergarten,query_string)
    excerpt_cont = excerpt(kindergarten.title, query_string, radius: 500)
    highlight(excerpt_cont, query_string)
  end

end
