FROM httpd:latest

#copy user auth file
COPY ./.htpasswd /usr/local/apache2/conf/.htpasswd
# Copy custom configuration file
COPY ./webdav.conf /usr/local/apache2/conf/extra/webdav.conf
# Copy httpd configuration file
COPY ./httpd.conf /usr/local/apache2/conf/httpd.conf
# Copy custom httpd-ssl file
COPY ./httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

RUN mkdir /usr/local/apache2/var
RUN touch /usr/local/apache2/var/davlock
RUN chown -R www-data:www-data /usr/local/apache2/var

EXPOSE 80
EXPOSE 443
CMD [ "httpd", "-D", "FOREGROUND" ]