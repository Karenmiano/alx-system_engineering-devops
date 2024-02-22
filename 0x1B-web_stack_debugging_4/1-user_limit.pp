# correct os configuration for holberton user
exec {'change-os-configuration-for-holberton-user':
    command => '/bin/sed -i "/holberton \(soft\|hard\) nofile [0-9]\+/d" /etc/security/limits.conf',
}
