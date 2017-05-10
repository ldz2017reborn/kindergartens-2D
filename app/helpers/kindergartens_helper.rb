module KindergartensHelper
    def render_kindergarten_status(kindergarten)
      if kindergarten.is_hidden
        "(Hidden)"
      else
        "(Public)"
      end
    end
end
