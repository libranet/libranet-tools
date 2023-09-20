# tools

These are some extra tools that can be deployed on a linux-vm.
We install them in ``/opt/tools``


## Deploy in /opt

```
sudo chown $USER:$USER /opt

cd /opt
git clone https://github.com/woutervh/tools.git tools
cd /opt/tools
```

## Installation
```
cd /opt/tools/<tool-name>
make install
```
