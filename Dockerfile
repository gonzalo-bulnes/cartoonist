FROM debian:stable

MAINTAINER Gonzalo Bulnes Guilpain <gon.bulnes@gmail.com>

COPY . /app
WORKDIR /app

# Installing System Dependencies
RUN apt-get update && apt-get install -y $(cat ./dependencies/os-linux.txt)

# Installing Fred's ImageMagick Scripts
RUN mkdir ./lib
RUN cat ./dependencies/lib.txt | xargs -I {} \
  wget -O ./lib/{} 'http://www.fmwconcepts.com/imagemagick/downloadcounter.php?scriptname={}&dirname={}'
RUN chmod +x ./lib/*

ENTRYPOINT ["/app/cartoonist.sh"]
