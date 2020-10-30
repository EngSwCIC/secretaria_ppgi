FROM ruby:2.6.3-stretch as installer

RUN apt update && apt install -y apt-utils

# install node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs

# install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn
ENV PATH "$PATH:/opt/yarn-1.22.5/bin" 

COPY . /secretaria/
WORKDIR /secretaria/
RUN bundle install
RUN gem install solargraph