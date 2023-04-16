# tools

These are some extra tools that can be deployed on a linux-vm.
We install them in ``/opt/tools``


## Deploy in /opt

```
sudo chown wouter:wouter /opt

cd /opt
git clone https://gitlab.com/ek-global/users/wvandenhove/tools.git  tools
cd /opt/tools
```


## Install the various tools

### glances
See https://nicolargo.github.io/glances/

```
cd /opt/tools/glances
make
```

### grin
See https://pypi.org/project/grin3/
```
cd /opt/tools/grin
make
```

### Neo4J
```
cd /opt/tools/neo4j
make install
```