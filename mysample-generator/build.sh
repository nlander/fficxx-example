#!/bin/bash
set -eu
set -o pipefail

sandbox="$(pwd)/../../../.cabal-sandbox/"
package_db="$sandbox/*-ghc-*-packages.conf.d/"

rm -rf MySampleGen
~/.stack/programs/x86_64-linux/ghc-8.4.3/bin/ghc -package-db $package_db MySampleGen.hs

rm -rf working/ MySample/
./MySampleGen

(   cd ./MySample/
    cabal sandbox --sandbox=$sandbox init
    cabal build
)
