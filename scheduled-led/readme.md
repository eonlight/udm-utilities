# Scheduled Led

## Install instructions

```

# 1. create required dirs
mkdir -p /mnt/data/scheduled-led/cron.d

# 2. download required bins
curl -s https://raw.githubusercontent.com/eonlight/udm-utilities/master/scheduled-led/scheduled-led.sh -o /mnt/data/scheduled-led/scheduled-led.sh
chmod +x /mnt/data/scheduled-led/scheduled-led.sh

# 3. update user, password, site and device in /mnt/data/scheduled-led/scheduled-led.sh

# 4. download cron configs
curl -s https://raw.githubusercontent.com/eonlight/udm-utilities/master/scheduled-led/cron.d/scheduled-led -o /mnt/data/scheduled-led/cron.d/scheduled-led

# 5. update on and off times in /mnt/data/scheduled-led/cron.d/scheduled-led

# 6. install persistency
curl -s https://raw.githubusercontent.com/eonlight/udm-utilities/master/scheduled-led/on_boot.d/29-scheduled-led.sh -o /mnt/data/on_boot.d/29-scheduled-led.sh
chmod +x /mnt/data/on_boot.d/29-scheduled-led.sh

# 7. install the utilie the first time
/mnt/data/on_boot.d/29-scheduled-led.sh
```
