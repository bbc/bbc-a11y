require 'bbc/a11y/cucumber_support/matchers'
require 'capybara'

module BBC::A11y::CucumberSupport
  describe 'matchers' do
    let(:page) do
      Capybara.string(html)
    end

    describe '#have_title_attribute_or_associated_label_tag' do
      context 'a form field with a title attribute' do
        let(:element) { Capybara.string(<<-HTML).find('input') }
        <input type="text" name="q" title="Search the BBC" />
        HTML
        it 'passes' do
          expect(element).to have_title_attribute_or_associated_label_tag
        end
      end

      context 'a form field with a label, associated by `for` attribute' do
        let(:element) { Capybara.string(<<-HTML).find('input') }
        <label for="search">Search the BBC</label>
        <input type="text" id="search" name="q" />
        HTML
        it 'passes' do
          expect(element).to have_title_attribute_or_associated_label_tag
        end
      end

      context 'a form field within a label' do
        let(:element) { Capybara.string(<<-HTML).find('input') }
        <label for="search">
          Search the BBC
          <input type="text" name="q" />
        </label>
        HTML
        it 'passes' do
          expect(element).to have_title_attribute_or_associated_label_tag
        end
      end

      context "a form field without associated label tag or title attribute" do
        let(:element) { Capybara.string(<<-HTML).find('input') }
        <input type="text" name="name" />
        HTML
        it 'fails' do
          expect(element).not_to have_title_attribute_or_associated_label_tag
        end
      end
    end
  end
end
