# defining client ssh configuration file
file { '/root/.ssh/school':
  content => "Host *\n\tPasswordAuthentication no\n\tIdentifyFile ~/.ssh/school",
}
