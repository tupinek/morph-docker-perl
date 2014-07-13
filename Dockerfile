FROM openaustralia/morph-base
MAINTAINER Lubomir Rintel <lkundrak@v3.sk>

RUN apt-get update

# Debian conveniently packages most useful Perl modules, which is great as
# we don't have to build anything ourselves and can just use what they ship.
RUN apt-get -y install 			\
	perl				\
	perl-base			\
	perl-modules			\
	libdbd-sqlite3-perl		\
	libdbi-perl			\
	libfile-slurp-perl		\
	libhtml-form-perl		\
	libhtml-parser-perl		\
	libhtml-tree-perl		\
	libhttp-message-perl		\
	libjson-perl			\
	libjson-xs-perl			\
	liblwp-protocol-https-perl	\
	libtest-exception-perl		\
	libtest-pod-perl		\
	libtext-csv-perl		\
	libtext-csv-xs-perl		\
	liburi-perl			\
	libweb-scraper-perl		\
	libwww-perl			\
	libwww-mechanize-perl		\
	libxml-dom-perl			\
	libxml-libxml-perl		\
	libxml-parser-perl		\
	libxml-perl			\
	libxml-sax-expat-perl		\
	libxml-simple-perl		\
	libxml-xpath-perl

# This one is not packaged in Debian.
RUN mkdir /build
RUN git clone https://github.com/lkundrak/perl-database-dumptruck.git /build
RUN cd /build && perl Build.PL && ./Build install
RUN rm -rf /build
