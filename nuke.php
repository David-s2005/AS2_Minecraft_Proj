<?php
    exec('/usr/bin/sudo -n /var/www/html/nuke.sh');
    header('Location: minecraft.html?success=true');
exit;