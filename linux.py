from netmiko import ConnectHandler
import time
import getpass
import logging

def main():
    logging.basicConfig(filename='test.log',level=logging.DEBUG)
    logger = logging.getLogger('netmiko')
    linux = {
        'device_type':'linux',
        'ip':'192.168.10.21',
        'username':input("Please Enter the User name: \n"),
        'password':getpass.getpass(),
        'port':22,
        'secret':getpass.getpass() # Root Password
    }
    connection = ConnectHandler(**linux)
    #This to enter the route password
    connection.enable()
    newUser = input("Please Enter New User Name: \n")
    connection.send_command(f'sudo useradd -m -d /home/{newUser} -s /bin/bash {newUser}\n')
    output= connection.send_command(f"getent passwd | grep {newUser}")
    print(output)
    connection.disconnect()
if __name__ == '__main__':
    main()