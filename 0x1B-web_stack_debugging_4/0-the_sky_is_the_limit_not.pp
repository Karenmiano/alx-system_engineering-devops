# correct file descriptor limit in stack
exec {'change-limit':
    provider => 'shell',
    command  => 'sed -i "s/ULIMIT=\"-n [0-9]\+\"/ULIMIT=\"-n 10000\"/g" /etc/default/nginx',
    before   => Exec['restart'],
}

exec {'restart':
    provider => 'shell',
    command  => 'service nginx restart',
}
