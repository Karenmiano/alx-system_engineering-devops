$motd_content = @(EOF) 
  This system is managed by Puppet 
  rocal changes will be overwritten by next Puppet run. 
  | EOF

  file { '/var/www/html/trial':
    ensure => 'file',
    content => $motd_content,
  }