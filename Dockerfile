FROM redmine:3.4.6

RUN mkdir /usr/src/redmine/inst
COPY ./data/setup.sh /usr/src/redmine/inst/setup.sh
RUN chown -R redmine. /usr/src/redmine/inst
RUN chmod +x /usr/src/redmine/inst/setup.sh