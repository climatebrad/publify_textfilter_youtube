# frozen_string_literal: true

require "rails_helper"

RSpec.describe PublifyApp::Textfilter::Youtube, type: :model do
  it "is registered in the list of textfilter plugins" do
    expect(TextFilterPlugin.available_filters).to include described_class
  end

  it "is registered in the list of macro filters" do
    expect(TextFilterPlugin.macro_filters).to include described_class
  end

  describe "#filter_text" do
    let(:filter) { TextFilter.none }

    describe "specific publify tags" do
      describe "youtube" do
        it "nothing if no args" do
          result = filter.filter_text("<publify:youtube />")
          expect(result)
            .to eq ''
        end

        it "default settings" do
          result = filter.filter_text('<publify:youtube v="example" />')
          expect(result)
          .to eq('<iframe width="560" height="315" src="https://www.youtube.com/embed/example" frameborder="0"' \
          ' allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;' \
          ' picture-in-picture; web-share"' \
          ' referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>' \
          '</iframe>')
        end

        it "all attributes" do
          result = filter
              .filter_text('<publify:youtube v="example" width="640" height="480" start="10" />')
          expect(result)
            .to eq '<iframe width="640" height="480" src="https://www.youtube.com/embed/example?start=10" frameborder="0"' \
            ' allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope;' \
            ' picture-in-picture; web-share"' \
            ' referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>' \
            '</iframe>'
        end
      end
    end

    it "test_youtube_plus_markup_chain" do
      text = <<~MARKUP
        *header text here*

        <publify:youtube v="example" />

        _footer text here_

      MARKUP

      expects_markdown = <<~HTML.strip
        <p><em>header text here</em></p>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/example" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
        <p><em>footer text here</em></p>
      HTML

      filter = TextFilter.markdown

      expect(filter.filter_text(text)).to eq expects_markdown
    end
  end
end
