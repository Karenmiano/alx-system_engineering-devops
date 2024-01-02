include stdlib

augeas { 'no passwords':
  context => '/files/etc/ssh/ssh_config',
  changes => [
    'set PasswordAuthentication no',
  ],
}

augeas { 'identity file':
  context => '/files/etc/ssh/ssh_config',
  changes => [
    'set IdentityFile ~/.ssh/school',
  ],
}
