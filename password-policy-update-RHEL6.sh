#Updated by KSP
#!/bin/bash

sed -i 's/.*pam_cracklib.so.*/password requisite pam_cracklib.so try_first_pass retry=3 type= retry=3 minlen=30 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/system-auth

sed -i 's/.*pam_cracklib.so.*/password requisite pam_cracklib.so try_first_pass retry=3 type= retry=3 minlen=30 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1/' /etc/pam.d/password-auth

sed -i '/pam_cracklib.so/ a password requisite pam_pwhistory.so remember=3 retry=3' /etc/pam.d/system-auth

sed -i '/pam_cracklib.so/ a password requisite pam_pwhistory.so remember=3 retry=3' /etc/pam.d/password-auth
