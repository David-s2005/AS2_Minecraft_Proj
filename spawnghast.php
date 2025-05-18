<?php
    exec('/usr/bin/sudo -n /var/www/html/spawnghast.sh');
    header('Location: minecraft.html?success=true');
exit;