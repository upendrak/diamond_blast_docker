FROM gcc:7
MAINTAINER Upendra Deivsetty <upendra@cyverse.org>
LABEL version="0.9.21" description="This Dockerfile is used for building DIAMOND BLAST"

RUN apt-get update
RUN apt-get install -y wget cmake
RUN wget http://github.com/bbuchfink/diamond/archive/v0.9.21.tar.gz
RUN tar xzf v0.9.21.tar.gz
WORKDIR diamond-0.9.21
RUN mkdir bin
WORKDIR bin
RUN cmake ..
RUN make install

ENTRYPOINT ["diamond"]
CMD ["help"]
