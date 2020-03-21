from netmiko import ConnectHandler
import getpass
import logging
import multiprocessing as mp
import time
logging.basicConfig(filename='Net.log', level=logging.DEBUG)
logger = logging.getLogger('netmiko')

def connect_and_run(device, cmd='show run'):
            #Create The Connection Object
            configurations = ConnectHandler(**device)

            # Place in Enable Mode
            configurations.enable()

            #Configure the Devices From A File the send_config AT enter into config t (mode)
            #configurations.send_config_from_file('ospf.txt')
            print ("Execeuting command:", cmd)
            output = configurations.send_command(cmd)
            print(output)

            #Close The Configurations
            configurations.disconnect()

def connect():
    with open('devices.txt') as f:
        # Read the File and Create a List of Devices IPs
        ips = f.read().splitlines()
    #This is the Time the Script Will Start
    scriptStart = time.time()
    # Define a Process for the Devices
    processes = list()
    try:
        for ip in ips:
            devicesDic = {
                'device_type': 'cisco_ios',
                'ip': ip,
                'username': input("Please Enter Your User Name: \n"),
                'password': getpass.getpass(),
                'port': 22,
                'secret': 'cisco',  # Secret or Linux Root Password
            }
            # Print which Device we are connecting to
            print("Connection to : " + devicesDic['ip'])

            # Call teh Connection and Run Function
            connect_and_run(devicesDic, 'show run')
        scriptEnd = time.time()

        print ("The Script Execution Time is ", scriptEnd - scriptStart)
    except Exception as e:
        print (e)
if __name__=="__main__":
    connect()