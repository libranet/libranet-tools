

https://hakoerber.github.io/git-repo-manager/tutorial.html


 cargo install git-repo-manager




grm repos find remote --provider github  --token-command "echo $GITHUB_TOKEN" --root github-libranet --format yaml --owner  > gh-woutervh.yaml


# create config by searching github
grm repos find remote --provider github --token-command "echo $GITHUB_TOKEN" --root github-libranet --format yaml --group libranet  > gh-libranet.yaml

# sync repos
grm repos sync config --config gh-libranet.yaml

# show status in table
grm repos status --config
