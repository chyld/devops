# copy the docker.service to /etc/systemd/system
# THIS FILE CANNOT BE LOCATED IN A USER DIR
# DO NOT SYMLINK IT

# for the system to "see" the new file
sudo systemctl daemon-reload

# start the service manually
sudo systemctl enable --now docker.service

# check if it is running
sudo systemctl status docker.service

# see logs relating to service, only for most recent reboot
sudo journalctl -u docker.service -b

