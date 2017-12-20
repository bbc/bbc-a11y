FROM node
MAINTAINER emma.richens@bbc.co.uk

RUN apt-get update && \
    apt-get install -y libgtk2.0-0 libgconf-2-4 libasound2 libxtst6 libxss1 libnss3 xvfb && \
    apt-get clean

# Install the latest straight from GitHub
RUN npm install --global git+https://github.com/bbc/bbc-a11y.git

RUN rm /usr/local/bin/bbc-a11y

ADD bbc-a11y /usr/local/bin/bbc-a11y

ENTRYPOINT ["bbc-a11y"]
