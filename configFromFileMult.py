from netmiko import ConnectHandler
import getpass
import logging
import time

logging.basicConfig(filename='test.log',level=logging.DEBUG)
logger = logging.getLogger('netmiko')

with open('devices.txt') as f:
    ips = f.read().splitlines()
    #Create and Empty List
device_list = list()
for ip in ips:
    devices = {
        'device_type':'cisco_ios',
        'ip':ip,
        'username':input("Please Enter The Username: \n"),
        'password':getpass.getpass(),
        'port':22,
        'secret':'cisco'
    }
     #Create a List of Dictionaries
    device_list.append(devices)
try:
    for device in device_list:
        print(" Connecting to: " + device['ip'])
        #Create The Connection Handle Object
        connection = ConnectHandler(**device)
        #Enter Into Enable Mode
        connection.enable()
        # Configure the Devices From a File.
        connection.send_config_from_file('ospf.txt')
        #connection.send_config_from_file('ospf.txt')
        #Close The Connection
        connection.disconnect()
except Exception as e:
    print(e)
