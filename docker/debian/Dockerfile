FROM markadams/chromium-xvfb-js

RUN apt-get update && apt-get install -y libgconf-2-4

RUN npm i bbc-a11y -g

RUN xvfb-run bbc-a11y http://www.bbc.co.uk
