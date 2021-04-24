#!/bin/bash

"
Run this as root to your new (Ubuntu based)
That will save you up to 70% compared to using a 'hosted' service


"

echo "EDIT THIS FILE BEFORE RUNNING"
exit 0  ## DELETE THIS

wget https://julialang-s3.julialang.org/bin/linux/x64/1.6/julia-1.6.1-linux-x86_64.tar.gz
tar zxvf julia-1.6.1-linux-x86_64.tar.gz
rm julia-1.6.1-linux-x86_64.tar.gz
ln -s `pwd`/julia-1.6.1/bin/julia /usr/local/bin/julia

git clone https://github.com/pankgeorg/PlutoCon2021-demos  ## EDIT THIS
cd PlutoCon2021-demos  # EDIT THIS (OR WHATEVER REPO)
git checkout main  # EDIT THIS (OR WHATEVER BRANCH)

cp pluto-deployment-environment/PlutoSliderServer.service /etc/systemd/system/
julia --project="pluto-deployment-environment" -e "import Pkg; Pkg.instantiate()";

systemctl start PlutoSliderServer.service
