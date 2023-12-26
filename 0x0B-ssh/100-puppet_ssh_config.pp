# defining client ssh configuration file
include stdlib

file_line { 'private_key _source':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => '  IdentityFile ~/.ssh/school',
  replace => true,
}

file_line { 'no passwords':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => '  PasswordAuthentication no',
  replace => true,
}
