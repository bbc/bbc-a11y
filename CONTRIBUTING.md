# BBC A11y Contributing guidelines

The standards are all stored in the `standards` directory.

You can run a manual test of your development copy of a11y at any time just by running:

    bundle exec ./bin/a11y <url>

You can also use cucumber to run one specific test:

    A11Y_URL=<url> bundle exec cucumber features/04_language.feature

The step definitions behind these features are shallow wrappers that delegate to objects in `lib/bbc/a11y/`. Those objects are unit-tested to ensure they'll behave as expected when tests pass or fail.

To add new behaviour, test-drive changes to the objects in `lib`.
