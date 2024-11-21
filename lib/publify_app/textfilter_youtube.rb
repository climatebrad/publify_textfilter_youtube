# frozen_string_literal: true

class PublifyApp
  class Textfilter
    class Youtube < TextFilterPlugin::MacroPre
      plugin_display_name "Youtube"
      plugin_description "Embed Youtube videos"

      DEFAULT_OPTIONS = { width: 560,
                          height: 315 }.freeze

      def self.help_text
        %{
You can use `<publify:youtube v=eXamPL />` to embed Youtube videos.

This uses the Ruby [Syntax](http://coderay.rubychan.de) module.  Options:

* **v**. Required, the video_id.
* **width**.  560 by default.
* **height**.  Height. 315 by default.
* **start**.  Sets the start time
}
      end

      def self.macrofilter(attrib)
        video_id = attrib[:v]
        return '' unless video_id # Video ID is required

        width = attrib.fetch(:width, '560')
        height = attrib.fetch(:height, '315')
        start = attrib[:start]

        src = "https://www.youtube.com/embed/#{video_id}"
        src += "?start=#{start}" if start

         <<~HTML
<iframe width="#{width}" height="#{height}" src="#{src}" frameborder="0"
 allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
 referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
</iframe>
         HTML
      end
    end
  end
end
