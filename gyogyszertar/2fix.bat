@call 0config.bat
chcp 1250
awk -f fix.awk %input% >gyogyszertar_%datum%.txt



