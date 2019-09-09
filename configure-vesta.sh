#!/bin/bash
CRT="/usr/local/vesta/ssl/certificate.crt"
KEY="/usr/local/vesta/ssl/certificate.key"

NEWCRT="/etc/letsencrypt/live/$1/fullchain.pem"
NEWKEY="/etc/letsencrypt/live/$1/privkey.pem"

CRTMSK="0$(stat -c "%a" "$CRT")"
CRTOWN=$(stat -c "%U" "$CRT")
CRTGRP=$(stat -c "%G" "$CRT")

KEYMSK="0$(stat -c "%a" "$KEY")"
KEYOWN=$(stat -c "%U" "$KEY")
KEYGRP=$(stat -c "%G" "$KEY")

rm "$CRT" "$KEY"

ln -s "$NEWCRT" "$CRT"
chown "$CRTOWN:$CRTGRP" "$CRT"
chmod "$CRTMSK" "$CRT"

ln -s "$NEWKEY" $(basename "$KEY")
chown "$KEYOWN:$KEYGRP" "$KEY"
chmod "$KEYMSK" "$KEY"