# godepgraph

Dependencies:

```
brew install graphviz
```

## Shepherd

Fetch:

```
go get github.com/kisielk/godepgraph
```

Visualise:

Shepherd:

```
cd shepherd
godepgraph -s synth | dot -Tpng -o godepgraph.png && open godepgraph.png
```

## Terraform

```
REPO="github.com/hashicorp/terraform"
NORMALISED_REPO="$(echo $REPO | sed 's/\//_/g')"
DOTFILE="$NORMALISED_REPO.dot"
PDF="$NORMALISED_REPO.pdf"

# Fetch
export GOPATH="~"
go get -u -v $REPO

# Visualise:
cd ~/src/$REPO
godepgraph -s -p $REPO/vendor/ $REPO | tee $DOTFILE
cat $DOTFILE | dot -Tpdf -o $PDF && open $PDF
```
