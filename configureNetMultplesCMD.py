#import netmiko
from netmiko import Netmiko
from netmiko import ConnectHandler
import getpass

#connection = Netmiko(host='192.168.15.222',username='hnhanga',password='Barreto18!', device_type='cisco_ios')
#Create The devices
devices = {
    'device_type':'cisco_ios',
    'ip': '192.168.15.221',
    'username':input("Please Enter Your Username \n"),
    'password': getpass.getpass(),
    'port':22,
    'secret':'cisco'
}
#Connect to the Devices
connection = ConnectHandler(**devices)
#Check in which prompt mode you are
mode = connection.find_prompt()
if '>' in mode:
    #Enter into enable mode
    connection.enable()
else:
    #With what we done we did not have to get into global configuration mode it would do it AT.
    #Enter int configure Mode
    connection.config_mode()
    #Create a List of Commands to run
    cmds = ['int loop3','ip add 3.3.3.3 255.255.255.255','exit']
    # To run a set of cmd use the commands below
    connection.send_config_set(cmds)
    #Write everything to memory like copy run to start
    output = connection.send_command_expect("write memory")
    print(output)


connection.disconnect()

