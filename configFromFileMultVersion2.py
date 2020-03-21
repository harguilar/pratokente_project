from netmiko import ConnectHandler
import getpass
import logging


logging.basicConfig(filename='testNet.log', level=logging.DEBUG)
logger = logging.getLogger('netmiko')
'''''
logging.basicConfig(filename='test.log',level=logging.DEBUG)
logger = logging.getLogger('netmiko')
'''
with open('devices.txt') as f:
    ips = f.read().splitlines()
try:
    for ip in ips:
        devicesDic = {
            'device_type':'cisco_ios',
            'ip':ip,
            'username':input("Please Enter Your User Name: \n"),
            'password':getpass.getpass(),
            'port':22,
            'secret':'cisco', # Secret Password or Root in Linux
        }
        # Print which Device we are connecting to
        print("Connection to : " + devicesDic['ip'])

        #Create The Connection Object
        configurations = ConnectHandler(**devicesDic)
        # Place in Enable Mode
        configurations.enable()
        #Configure the Devices From A File IT will Automatically Enter the Configuration mode and Send the CMDs
        configurations.send_config_from_file('ospf.txt')
        #Close The Configurations
        configurations.disconnect()
except Exception as e:
    print (e)