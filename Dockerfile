FROM debian:jessie
MAINTAINER Andrea Cervesato <sawk.ita@gmail.com>

RUN apt-get update

# Install services
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
        apache2 \
        cgit \
        python-pygments

# Create cgit repositories path
RUN mkdir /srv/cgit/

# Configure cgit
ADD ./config/cgitrc /etc/cgitrc

# Configure apache
RUN cd /etc/apache2/mods-enabled && ln -s -f ../mods-available/cgi.load
RUN cd /etc/apache2/conf-enabled && ln -s -f ../conf-available/cgit.conf

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
