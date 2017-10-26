FROM redis:3.2.11

MAINTAINER skola

# Install supervisor to monitor both redis and the webapp
RUN apt-get update && \
    apt-get install -y curl python supervisor && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

# Extract tar and move the public folder into the distribution folder
# NOTE: We do this in a single RUN statement so we can remove the tar.gz and keep the image size down
RUN cd / && \
    curl https://s3-us-west-2.amazonaws.com/techops-interview-webapp/webapp.tar.gz -o webapp.tar.gz && \
    tar zxvf webapp.tar.gz && \
    rm -f webapp.tar.gz && \
    mv public/ dist/

# api key for guestbook
ENV APIKEY=

# Expose guestbook port
EXPOSE 3000

# override redis entrypoint & cmd defaults
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [""]
