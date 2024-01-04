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

	    location / {
		    try_files $uri $uri/ =404;
	    }
    }
    | EOF

exec { 'change_config':
    path    => '/usr/bin',
    command => 'sudo sed -i "s/\s*server_name _;/&\n\trewrite ^\/redirect_me.*$ https:\/\/example.com permanent;\n\terror_page 404 \/custom_404.html;/" /etc/nginx/sites-available/default',
}