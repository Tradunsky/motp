# Set 1password master password in mac keychain via TouchID
#/usr/bin/osascript -e 'do shell script "security add-generic-password -a 1password.com -s 1password -w ***" with administrator privileges'
#/usr/bin/osascript -e 'do shell script "security add-generic-password -a 1password.com -s 1password-secret-key -w ***" with administrator privileges'
PASSWORD_HOST=company_name.1password.com
EMAIL=name@gmail.com

# Get 1password master and secret-key password from mac keychain via TouchID
SEC_MAS=$(
  /usr/bin/osascript -e 'do shell script "
   S=$(security find-generic-password -w -s 1password-secret-key);
   M=$(security find-generic-password -w -s 1password);
   printf \"$S $M\"
   "  with administrator privileges'
)
PASSWORDS=($SEC_MAS)
SECRET_KEY=${PASSWORDS[0]}
MASTER_PASSWORD=${PASSWORDS[1]}

# Authenticate on 1password server
eval $(op signin $PASSWORD_HOST $EMAIL "$SECRET_KEY" <<<$MASTER_PASSWORD)

# Get OTP for a given profile/password
op get totp $1 | pbcopy

otp=$(pbpaste)
echo $1" OTP "$otp" copied to the clipboard"