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

    describe '#to_s' do
      let(:html) { "<html><body><h1>Header</h1><p>More stuff</p></body></html>" }

      it 'renders the visible text on the page' do
        expect(page.to_s).to eq "HeaderMore stuff"
      end
    end
  end
end
