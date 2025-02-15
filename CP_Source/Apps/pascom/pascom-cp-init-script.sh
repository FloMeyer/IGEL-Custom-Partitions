#! /bin/bash
#set -x
#trap read debug

ACTION="custompart-pascom_Client_${1}"

# mount point path
MP=$(get custom_partition.mountpoint)

# custom partition path
CP="${MP}/pascom_Client"

# Teams directory
PASCOM="/userhome/.local/share/AppRun"

# output to systemlog with ID amd tag
LOGGER="logger -it ${ACTION}"

echo "Starting" | $LOGGER

case "$1" in
init)
  # Linking files and folders on proper path
  #find ${CP} | while read LINE
  #do
    #DEST=$(echo -n "${LINE}" | sed -e "s|${CP}||g")
    #if [ ! -z "${DEST}" -a ! -e "${DEST}" ]; then
      ## Remove the last slash, if it is a dir
      #[ -d $LINE ] && DEST=$(echo "${DEST}" | sed -e "s/\/$//g") | $LOGGER
      #if [ ! -z "${DEST}" ]; then
        #ln -sv "${LINE}" "${DEST}" | $LOGGER
      #fi
    #fi
  #done

  # Initial permissions
  chown -R root:root "${CP}" | $LOGGER
# basic persistency
  ln -sv "${CP}${PASCOM}" "${PASCOM}"
  chown -R user:users "${CP}${PASCOM}"

  # Add apparmor profile to trust Teams in Firefox to make SSO possible
  # We do this by a systemd service to run the reconfiguration
  # surely after apparmor.service!!!
  #systemctl --no-block start igel-pascom_Client-cp-apparmor-reload.service

  # after CP installation run wm_postsetup to activate pascom_Client.desktop mimetypes for SSO
  #if [ -d /run/user/777 ]; then
    #wm_postsetup
    ## delay the CP ready notification
    #sleep 3
  #fi

;;
stop)
  # unlink linked files
  #find ${CP} | while read LINE
  #do
    #DEST=$(echo -n "${LINE}" | sed -e "s|${CP}||g")
    #unlink $DEST | $LOGGER
  #done

;;
esac

echo "Finished" | $LOGGER

exit 0
