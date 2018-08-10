FROM node:9.3.0

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update -y && \
    apt-get install -y libgconf-2-4 google-chrome-stable xvfb

RUN yarn add bbc-a11y@2.2.0

RUN echo '#!/bin/sh\nxvfb-run node_modules/.bin/bbc-a11y "$@"' > /usr/local/bin/bbc-a11y
RUN chmod +x /usr/local/bin/bbc-a11y

ENTRYPOINT ["bbc-a11y"]
