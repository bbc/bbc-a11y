require 'bbc/a11y/cucumber_support/heading_hierarchy'
require 'capybara'

module BBC::A11y::CucumberSupport
  describe HeadingHierarchy do

    let(:hierarchy) do
      HeadingHierarchy.new(page)
    end

    let(:page) do
      # patch Capybara::String to look just enough like a real Capybara::Session to work
      page = Capybara.string(html)
      source = html
      page.define_singleton_method(:source) { source }
      page
    end

    describe '#validate' do

      context 'a simple, valid h1-h6 hierachy' do
        let(:html) { <<-HTML }
        <html>
          <body>
            <h1>Heading 1</h1>
            <h2>Heading 2</h2>
            <h3>Heading 3</h3>
            <h4>Heading 4</h4>
            <h5>Heading 5</h5>
            <h6>Heading 6</h6>
          </body>
        </html>
        HTML

        it 'passes' do
          expect { hierarchy.validate }.not_to raise_error
        end
      end

      context 'an invalid h1-h3 hierarchy' do
        let(:html) { <<-HTML }
        <html>
          <body>
            <h1>Heading 1</h1>
            <h3>Heading 3</h3>
            <h2>Heading 2</h2>
          </body>
        </html>
        HTML

        it 'fails' do
          expect { hierarchy.errors }.to raise_error("Headings were not in order: h1, **h3**, h2")
        end
      end

      context 'an hierarchy that skips back up from h4 to h2' do
        let(:html) { <<-HTML }
        <html>
          <body>
            <h1>Heading 1</h1>
            <h2>Heading 2</h2>
            <h3>Heading 3</h3>
            <h4>Heading 4</h4>
            <h2>Heading 2b</h2>
            <h3>Heading 3b</h3>
          </body>
        </html>
        HTML

        it 'passes' do
          expect { hierarchy.validate }.not_to raise_error
        end
      end


    end

    describe "#to_s" do
      context 'an hierarchy that skips back up from h4 to h2' do
        let(:html) { <<-HTML }
        <html>
          <body>
            <h1>Heading 1</h1>
            <h2>Heading 2</h2>
            <h3>Heading 3</h3>
            <h4>Heading 4</h4>
            <h2>Heading 2b</h2>
            <h3>Heading 3b</h3>
          </body>
        </html>
        HTML

        it 'renders a nested hierarchy' do
          expected = <<-TEXT
h1
  h2
    h3
      h4
  h2
    h3
TEXT
          expect( hierarchy.to_s ).to eq expected.strip
        end
      end
    end

    context "hidden headings" do
      let(:html) { <<-HTML }
        <html>
          <body>
            <h1 style="display:none">Heading 1</h1>
          </body>
        </html>
      HTML

      it "sees them" do
        expect( hierarchy.to_s ).to eq "h1"
      end

    end

    context "headings within a script tag" do
      # e.g. template elements too
      let(:html) { <<-HTML }
        <html>
          <body>
            <h1>Heading 1</h1>
            <script>
              var stuff = "<h2>Heading 2</h2>";
            </script>
          </body>
        </html>
      HTML

      it "ignores them" do
        expect( hierarchy.to_s ).to eq "h1"
      end
    end

    context "with headings before the first h1" do
      # rules only apply to headings after the main h1
      let(:html) { <<-HTML }
        <html>
          <body>
            <h3>Ignore me</h3>
            <h1>Heading 1</h1>
            <h2>Heading 2</h2>
          </body>
        </html>
      HTML

      it "ignores them" do
          expected = <<-TEXT
h1
  h2
TEXT
        expect( hierarchy.to_s ).to eq expected.strip
      end
    end

  end
end
