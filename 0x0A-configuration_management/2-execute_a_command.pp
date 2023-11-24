# kills a process killmenow
exec { 'pkill killmenow':
  path    => '/usr/bin/',
  command => 'pkill killmenow',
}
