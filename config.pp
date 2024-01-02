file { '/home/karen/.ssh/config':
  ensure  => file,
  content => "Host *\n PasswordAuthentication no\n IdentityFile ~/.ssh/school",
}
