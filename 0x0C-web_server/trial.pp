$contenu = $facts['hostname']
$lecontenu = @("EOF")
Bonjour
$contenu
EOF
file { 'aaaaa':
  ensure => 'present',
  path   => '/home/karen/sasa',
  content => $lecontenu,
}

