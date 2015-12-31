#!/usr/bin/env bash

# Install location of UCSF Chimera
CHIMERA_HOME=/opt/UCSF/Chimera64-1.10.2
# Command location of UCSF Chimera
chimera=$CHIMERA_HOME/bin/chimera
# ligand preparation location of Autodock vina
prepare_receptor=$CHIMERA_HOME/lib/python2.7/site-packages/AutoDockTools/Utilities24/prepare_receptor4.py

if (( $# != 2 )); then
        echo "Usage: ./pdb2pdbqt.sh receptor.pdb receptor.pdbqt"
        exit 1
fi

pdb=$1
pdbqt=$2

$chimera --nogui --nostatus --script "$prepare_receptor -r $pdb -o $pdbqt"

