from kubernetes import client, config

def init():
  config.load_kube_config()

def get_cluster_ip():
  c = client.CoreV1Api()
  data = c.list_endpoints_for_all_namespaces()
  try:
    cluster_ip =  [ item.subsets[0].addresses[0].ip for item in data.items if item.metadata.name == "kubernetes" ][0]
  except:
    print("Fail to get k8s cluster ip !")
    exit()
  return cluster_ip

def get_service_node_port(service):
  c = client.CoreV1Api()
  data = c.list_service_for_all_namespaces()
  try:
    node_port = [ item.spec.ports[0].node_port for item in data.items if item.metadata.name == service][0]
  except:
    print("fail to get node service port !")
  return node_port

def get_service_url(service):
  cluster_ip = get_cluster_ip()
  node_port = get_service_node_port(service)
  
  return "http://"+cluster_ip+":"+str(node_port)
