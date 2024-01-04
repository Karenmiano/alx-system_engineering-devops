# puppet manifest to install and configure nginx on server

# Install Nginx package
package { 'nginx':
    ensure  => 'installed',
}

# Define nginx service
service { 'nginx':
    ensure  => 'running',
    require => Package['nginx'],
}

# change nginx welcome page
file { '/var/www/html/index.html':
    ensure  => 'file',
    content => 'Hello World!',
}

# Define 404 error page content
file { '/var/www/html/custom_404.html':
    ensure  => 'file',
    content => 'Ceci n\'est pas une page',
}

# content for /etc/nginx/sites-available/default
$config = @(EOF)
    server {
	    listen 80 default_server;
	    listen [::]:80 default_server;

	    root /var/www/html;
	    index index.html index.htm index.nginx-debian.html;

	    server_name _;
        rewrite ^/redirect_me https://example.com permanent;
        error_page 404 /custom_404.html;

	    location / {
		    try_files \$uri \$uri/ =404;
	    }
    }
    | EOF

# ensuring content present in config file
file { '/etc/nginx/sites-available/default':
    ensure  => 'file',
    content => $config,
}