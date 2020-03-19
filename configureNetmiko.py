#import netmiko
from netmiko import Netmiko
from netmiko import ConnectHandler
import getpass

#connection = Netmiko(host='192.168.15.222',username='hnhanga',password='', device_type='cisco_ios')
#Create The devices
devices = {
    'device_type':'cisco_ios',
    'ip': '192.168.15.221',
    'username':'hnhanga',
    'password':getpass.getpass()

}
#Connect to the Devices
connection = ConnectHandler(**devices)
#Check Which Mode the device is:
prompt = connection.find_prompt()
if '>' in prompt:
    #Enter Into the Enable Mode
    connection.enable()
else:
    output = connection.send_command('show ip int brief')
    print(output)
#Check if we are in Global Configuration Mode
mode = connection.check_config_mode()

print("Before: " +str(mode))

if not mode:
    #Enter Global Config Mode
    connection.config_mode()

mode = connection.check_config_mode()

print("After: " +str(mode))
connection.disconnect()

