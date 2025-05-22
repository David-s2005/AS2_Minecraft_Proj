<?php
    exec('/usr/bin/sudo -n /var/www/html/zeus.sh');
    header('Location: minecraft.html?success=true');
exit;