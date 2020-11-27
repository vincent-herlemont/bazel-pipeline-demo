from util import k8s
from sys import argv
import click

cli = click.Group()


@cli.command()
@click.argument('service')
def get_service_url(service):
    k8s.init()
    print(k8s.get_service_url(service))

@cli.command()
def get_cluster_url():
    k8s.init()
    print('http://'+k8s.get_cluster_ip())

if __name__ == '__main__':
    cli()