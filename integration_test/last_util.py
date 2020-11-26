from kubernetes import client, config

def get_service_url(service):
  config.load_kube_config()
  c = client.CoreV1Api()
  data = c.list_endpoints_for_all_namespaces()
  try:
    cluster_ip =  [ item.subsets[0].addresses[0].ip for item in data.items if item.metadata.name == "kubernetes" ][0]
  except:
    print("Fail to get k8s cluster ip !")
    exit()

  c = client.CoreV1Api()
  data = c.list_service_for_all_namespaces()
  try:
    node_port = [ item.spec.ports[0].node_port for item in data.items if item.metadata.name == "dispatcher"][0]
  except:
    print("fail to get node service port !")
  
  return "http://"+cluster_ip+":"+str(node_port)
