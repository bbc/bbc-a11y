require 'bbc/a11y/cucumber_support/page'
require 'capybara'

module BBC::A11y::CucumberSupport
  describe Page do
    let(:page) do
      Page.new(Capybara.string(html))
    end

    describe '#all_elements_matching' do
      context 'with multiple matches' do
        let(:html) { <<-HTML }
        <html>
          <ul>
            <li><p></li>
            <li></li>
          </ul>
        </html>
        HTML
        it 'returns each element that matches' do
          expect(page.all_elements_matching('li', 'p').length).to eq 3
        end
      end
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

    describe "#must_not_have_any_elements_with_tabindex_greater_than" do
      context "an element with a tabindex value of 1" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <a tabindex="1">Important</a>
          </body>
        </html>
        HTML

        it "fails for zero" do
          expect { page.must_not_have_any_elements_with_tabindex_greater_than 0 }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end

        it "passes for 1" do
          expect { page.must_not_have_any_elements_with_tabindex_greater_than 0 }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end
      end
    end

    describe "#must_not_have_elements_with_tabindex" do

      context "an element that's in the list of exceptions" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <a tabindex="0">Important</a>
          </body>
        </html>
        HTML

        it "passes" do
          expect { page.must_not_have_elements_with_tabindex(0, except: 'a') }.not_to raise_error
        end
      end

      context "an element not in the list of exceptions" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <p tabindex="0">Important</a>
          </body>
        </html>
        HTML

        it "fails" do
          expect { page.must_not_have_elements_with_tabindex(0, except: 'a') }.
            to raise_error(RSpec::Expectations::ExpectationNotMetError)
        end
      end

      context "a different tabindex value" do
        let(:html) { <<-HTML }
        <html>
          <body>
            <p tabindex="-1">Important</a>
          </body>
        </html>
        HTML

        it "passes" do
          expect { page.must_not_have_elements_with_tabindex(0, except: 'a') }.not_to raise_error
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
