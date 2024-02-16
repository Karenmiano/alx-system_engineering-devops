# corrects typo in word-press file
exec {'correct letter':
    command => '/bin/sed -i s/class-wp-locale.phpp/class-wp-locale.php/g /var/www/html/wp-settings.php',
}
