file_line { 'aaaaa':
  ensure => 'present',
  path   => '/var/www/html/index.html',
  line   => 'rewrite ^/redirect_me https://www.github.com/lewisthagichu permanent;',
}

