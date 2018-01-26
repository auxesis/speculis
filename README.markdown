# Speculis

Speculis tracks metadata about how modular open source projects are.

By tracking how modular open source projects are, we can categorise them as having core-periphery, borderline, multi-core, or hierarchical technical structures.

The approach is based heavily on the research by Carliss Baldwin, Alan MacCormack, and John Rusnak in their 2014 paper [Hidden Structure: Using Network Methods to Map System Architecture](http://www.hbs.edu/faculty/Publication%20Files/13-093_3011858c-cd52-494b-b58b-f46af7331e85.pdf).

## Running

For a given open source project, generate a dotfile of the dependencies between modules:

```
sh wuzz/run.sh
```

This outputs a dotfile into `artifacts/`.

Then report on cyclic and acyclic dependencies:

```
bundle exec ruby parse.rb artifacts/github.com_asciimoo_wuzz.dot
```

This produces a JSON representation of cyclical and acyclical dependencies:

``` json
{
  "packages": {
    "_0": "github.com/..."
    ...
  },
  "acyclical": [
    ...
  ],
  "cyclical": [
    ...
  ],
}
```

## Dependencies

Speculis expects you have the following dependencies installed:

Ruby:

 - 2.4.2
 - `bundler`

Golang:

 - &gt;= 1.9.2
 - `godepgraph`
