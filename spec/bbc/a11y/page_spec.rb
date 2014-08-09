require_relative '../../../lib/bbc/a11y/page'
require 'capybara'

module BBC::A11y
  describe Page do
    let(:page) do
      Page.new(Capybara.string(html))
    end

    describe '#must_have_lang_attribute' do
      context 'with no lang attribute' do
        let(:html) { <<-HTML }
        <html>
        </html>
        HTML

        it 'fails' do
          expect { page.must_have_lang_attribute }.to raise_error(
            RSpec::Expectations::ExpectationNotMetError, 
            %{expected to find css "html[lang]" but there were no matches})
        end
      end

      context 'with a lang attribute' do
        let(:html) { <<-HTML }
        <html lang="en-GB">
        </html>
        HTML

        it 'passes' do
          expect { page.must_have_lang_attribute }.not_to raise_error
        end
      end
    end

    describe '#must_have_lang_attribute_of' do
      let(:html) { <<-HTML }
      <html lang="en-GB">
      </html>
      HTML

      it 'passes for a matching lang attribute' do
        expect { page.must_have_lang_attribute_of('en') }.not_to raise_error
      end

      it 'fails for the wrong language code' do
        expect { page.must_have_lang_attribute_of('fr') }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
      end
    end

    describe "#must_have_no_elements_with_title_attribute_content_repeated_within" do
      context "when an element has the same title attribute as its contents" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <a title="News">News</a>
          </body>
        </html>
        HTML

        it "fails" do
          expect { page.must_have_no_elements_with_title_attribute_content_repeated_within }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end
      end

      context "when an element has a valid title" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <img title="A picture of a cat">
          </body>
        </html>
        HTML

        it "passes" do
          expect { page.must_have_no_elements_with_title_attribute_content_repeated_within }.
            not_to raise_error
        end
      end

    end

    describe "#must_have_no_form_fields_with_label_and_title" do
      context "a form field with both label and title" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <form>
              <label for="name">Your name</label>
              <input id="name" title="Your name please">
            </form>
          </body>
        </html>
        HTML

        it "fails" do
          expect { page.must_have_no_form_fields_with_label_and_title }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end
      end
    end

    describe "#must_not_have_any_positive_tabindex_values" do
      context "a positive tabindex value" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <a tabindex="1">Important</a>
          </body>
        </html>
        HTML

        it "fails" do
          expect { page.must_not_have_any_positive_tabindex_values }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end
      end
    end

    describe '#to_s' do
      let(:html) { "<html><body><h1>Header</h1><p>More stuff</p></body></html>" }

      it 'renders the visible text on the page' do
        expect(page.to_s).to eq "HeaderMore stuff"
      end
    end

  end
end
