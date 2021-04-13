<<<<<<< HEAD
# Defines https://hub.docker.com/repository/docker/hamelsmu/fastpages-jekyll
FROM jekyll/jekyll:4.0.0

COPY . .

# Pre-load all gems into the environment
=======
# Defines https://hub.docker.com/repository/docker/fastai/fastpages-jekyll
FROM jekyll/jekyll:4.1.0

COPY . .
RUN chmod -R 777 .
>>>>>>> template/master
RUN gem install bundler 
RUN jekyll build
