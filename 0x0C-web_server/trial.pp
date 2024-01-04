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
}EOF

file { '/var/www/html/trial':
  ensure => 'file',
  content => $config,
}