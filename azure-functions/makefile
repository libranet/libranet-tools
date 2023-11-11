# This is a comment.
# Important: You *must* indent using <TAB>s, not spaces.


SED=`command -v gsed || command -v sed`
TMPDIR = $(shell readlink -f var/tmp)

# see https://github.com/Azure/azure-functions-core-tools/releases
VERSION=4.0.5390
FILENAME="Azure.Functions.Cli.linux-x64.${VERSION}.zip"
DOWNLOAD_URL="https://github.com/Azure/azure-functions-core-tools/releases/download/${VERSION}/${FILENAME}"

clean:
	@ rm -fr bin
	@ rm -fr var

create-dirs:
	@ mkdir -p bin
	@ mkdir -p var/tmp

install: create-dirs download-installer install-symlinks

update:

download-installer:
	@ curl -sSLf ${DOWNLOAD_URL} --output var/tmp/${FILENAME}
	@ unzip var/tmp/${FILENAME} -d var/azure-functions-cli
	@ chmod u+x var/azure-functions-cli/func var/azure-functions-cli/gozip

install-symlinks:
	cd bin && ln -sf $(realpath var/azure-functions-cli/func)
	cd ~/bin && ln -sf $(realpath var/azure-functions-cli/func)
