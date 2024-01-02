# Seting up my client config file
include stdlib

file_line { 'no passwords':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => '    PasswordAuthentication no',
  match    => 'PasswordAuthentication',
  multiple => 'true',
}

file_line { 'identity file':
  ensure   => present,
  path     => '/etc/ssh/ssh_config',
  line     => '    IdentityFile ~/.ssh/school',
  match    => '.*IdentityFile',
  multiple => 'true',
}