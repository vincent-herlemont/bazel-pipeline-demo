from util import k8s
from sys import argv

if len(argv) > 1:
    print(k8s.get_service_url(argv[1]))
else:
    print("you must k8s provide service name as arguments")