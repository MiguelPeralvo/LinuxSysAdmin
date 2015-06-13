__author__ = 'MiguelPeralvo'


from ec2_launch_instance import launch_instance
instance, cmdshell = launch_instance()
cmdshell.shell()
instance.terminate()