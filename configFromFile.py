from netmiko import ConnectHandler
import getpass

def main():

    devices = {
        'device_type':'cisco_ios',
        'ip':'xxxxx',
        'username':'xxxxxx',
        'password':getpass.getpass(),
        'port':22,
        'secret':'cisco'
    }
    #Create The Connection Handle Object
    connection = ConnectHandler(**devices)
    #Enter Into Enable Mode
    connection.enable()
    # Configure the Devices From a File.
    connection.send_config_from_file('ospf.txt')
    #Close The Connection
    connection.disconnect()
if __name__== '__main__':
  main()




