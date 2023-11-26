# defining client ssh configuration file
include stdlib

file_line { 'private_key _source':
  ensure => present,
  path => '/root/.ssh/school',
  line => '  IdentityFile ~/.ssh/school',
}

file_line { 'no passwords':
  ensure => present,
  path => '/root/.ssh/school',
  line => ' PasswordAuthentication no',
}
