This project allows my website (2DayBan.com) to communicate with a Minecraft server on the cloud. There is a HTML
button that you can click, which activates a PHP script that activates a shell script using the RCON protocol to 
use a command on the Minecraft server.

**Implementation**

_Minecraft Server:_
First you'll need a minecraft server, you can create a Minecraft server on AWS with the following tutoiral from AWS:
 https://aws.amazon.com/blogs/gametech/setting-up-a-minecraft-java-server-on-amazon-ec2/
Once your done here, make sure you edit you inbound rules for the Minecraft server to include port 25575, and to only
accept traffic from your websites IP address to port 25575. Set the outbound rules for your website to also include
port 25575 to your Minecraft server only.

Doing this allows RCON to be used on both servers, enabling communication.

_MCRCON:_
We are using MCRCON, a RCON client for Minecraft.
 https://github.com/Tiiffi/mcrcon
Install the client from the GitHub page and compile it on your Minecraft and website servers. Instructions for downloading
and compiling the client can be found on the MCRCON github page.

After compiling, make sure you move the executable to /usr/local/bin/
sudo mv mcrcon /usr/local/bin/
This ensures MCRCON is executable everywhere on the servers. Make sure it has appropiate permissions using chmod (744). 

You'll need to configure your Minecraft server to take RCON traffic by editing the server properties file. Open the
file by using:
sudo nano /opt/minecraft/server/server.properties
Change the following
enable-rcon -> true
rcon.port -> 25575
rcon.password -> PASSWORD

After this you should be able to send commands to the Minecraft server using RCON / MCRCON. Try the following command
in your websites server's terminal:
mcrcon –H (mc server ip) -P 25575 –p ‘PASSWORD’ “say Hello World!”

_PHP:_
Our website needs to use a server-side language to enable the server to execute commands if someone on the client side
does something (e.g. pressing a button).

To install PHP on our website server, we can follow this tutorial:
https://documentation.ubuntu.com/server/how-to/web-services/install-php/index.html
sudo apt install php libapache2-mod-php

_Apache2 Permissions:_
We need to allow apache2 to execute our shell script without sudo. We can do this by appending the following line into
the sudoers file. First open this sudoers file on the minecraft server with:
sudo visudo
and append
www-data ALL=(root) NOPASSWD: /var/www/html/sriptname.sh
