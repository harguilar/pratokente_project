from netmiko import ConnectHandler
import getpass
import logging
import multiprocessing as mp
import time

logging.basicConfig(filename='testNet.log', level=logging.DEBUG)
logger = logging.getLogger('netmiko')
'''''
logging.basicConfig(filename='test.log',level=logging.DEBUG)
logger = logging.getLogger('netmiko')
'''
ip = ""
def devIps():
    try :
        with open('devices.txt') as f:
            ips = f.read().splitlines()
        return ips
    except Exception as e:
        print(e)

def setDeviceType(ip, **deviceDic):
    try :
        deviceDic = {
            "device_type":"cisco_ios",
            "ip":ip,
            "username":input("Please Enter YOur Username :\n"),
            "password":getpass.getpass(),
            "port":22,
            "secret":"cisco"
        }
        print("Connection to : " + deviceDic['ip'])
        #Return The Dictionary
        return deviceDic
    except Exception as e:
        print(e)

def config():
    #create an Empty Dictionary
    newdeviceDic = {}
    #Create a List of Device IPs
    ips = devIps()
    for ip in ips:
        newdeviceDic = setDeviceType(ip, newdeviceDic = {})

        # Create The Connection Object
        configurations = ConnectHandler(**newdeviceDic)
        try:
            for ip in ips:
                # Place in Enable Mode
                configurations.enable()
                #Configure the Devices From A File IT will Automatically Enter the Configuration mode and Send the CMDs
                configurations.send_config_from_file('ospf.txt')
                #Close The Configurations
                configurations.disconnect()
        except Exception as e:
            print (e)
if __name__ == "__main__":
    # it Will Take a list of all the Processes
    '''
    process = list()
    for ips in ip:
        #Create The Processes
        process.append(mp.Process(target=config,))
    for p in process:
        #Start the Process
        p.start()
    for p in process:
        p.join()
    '''
    p1 = mp.Process(target=config)
    p1.start()
    p1.join()

