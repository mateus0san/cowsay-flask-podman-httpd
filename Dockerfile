FROM python:3.11-slim

# Install Apache, mod_wsgi, and cowsay
RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-wsgi-py3 cowsay && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV PATH="/usr/games:$PATH"

# Create app directory
WORKDIR /var/www/html/app

# Copy files
COPY app.py cowsayapp.wsgi requirements.txt ./

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Add Apache site config
RUN echo '<VirtualHost *:80>\n\
    WSGIDaemonProcess cowsayapp threads=5\n\
    WSGIScriptAlias / /var/www/html/app/cowsayapp.wsgi\n\
    <Directory /var/www/html/app>\n\
        Require all granted\n\
    </Directory>\n\
</VirtualHost>' > /etc/apache2/sites-available/000-default.conf

# Expose port
EXPOSE 80

# Start Apache in foreground
CMD ["apachectl", "-D", "FOREGROUND"]
