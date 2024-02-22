# correct file descriptor limit in stack
exec {'change-limit':
    path    => '/bin',
    command => 'sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 10000\"/g" /etc/default/nginx',
}
