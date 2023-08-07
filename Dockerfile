FROM httpd:latest

COPY ./.htpasswd /usr/local/apache2/conf/.htpasswd
# Copy custom configuration file
COPY ./webdav.conf /usr/local/apache2/conf/extra/webdav.conf
RUN sed -i \
        -e 's/#LoadModule mpm_event_module/LoadModule mpm_event_module/g' \
        -e 's/#LoadModule dav_module/LoadModule dav_module/g' \
        -e 's/#LoadModule dav_fs_module/LoadModule dav_fs_module/g' \
        -e '$a Include conf/extra/webdav.conf' \
        /usr/local/apache2/conf/httpd.conf

RUN mkdir /usr/local/apache2/var
RUN touch /usr/local/apache2/var/davlock
RUN chown -R www-data:www-data /usr/local/apache2/var

EXPOSE 80
CMD [ "httpd", "-D", "FOREGROUND" ]