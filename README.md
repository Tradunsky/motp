# Mac OTP CLI generator
TouchID for command-line is [not implemented](https://www.reddit.com/r/1Password/comments/dq80so/touchid_with_op_cli/) by 1password. This is the simplest still secure script to combine
 privileged run of cli script with TouchID authentication and cli interface for OTP generator.
 
# Quick start
0. [Install 1password command-line tool](https://support.1password.com/command-line-getting-started/)
1. Save 1password credentials into mac keychain.  
    Master password: 
    ```shell script
    /usr/bin/osascript -e 'do shell script "security add-generic-password -a 1password.com -s 1password -w MASTER_PASSWORD" with administrator privileges'
    ```
    Secret key:
    ```shell script
    /usr/bin/osascript -e 'do shell script "security add-generic-password -a 1password.com -s
     1password-secret-key -w $SECRET_KEY" with administrator privileges' 
    ```
2. Edit `otp-mac.sh` script to contain 1password host (usually company name) and your email

# Usage
`./otp-mac.sh <password name>`
password name - name of the password stored in 1password.

```shell script
./otp-mac.sh okta
okta OTP 100500 copied to the clipboard
```

  
# FAQ
#### How secure is it to store OTP passwords at the same device?  
_It is less secure than storing them on a separate device, however, because of complexity of
 passwords we often have access to them at the same device as we have OTP authenticators. Read
  more about points in storing OTP together with passwords [here](https://blog.1password.com/totp
  -for-1password-users/)._  
#### Why not to use 1password widget for MAC?  
_You can use it, although it is not programmable. This script intended to be used together
 with programmable scripts, such as automator script to type profile name in search and
  automatically have OTP populated into clipboard._
#### I do not have 1password, it is proprietary. But I still want to have a script authenticated by TouchID.
_Stay tuned._  
  