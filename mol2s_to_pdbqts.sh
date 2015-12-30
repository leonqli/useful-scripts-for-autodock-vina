#!/usr/bin/env bash

# Install location of UCSF Chimera
CHIMERA_HOME=/opt/UCSF/Chimera64-1.10.2
# Command location of UCSF Chimera
chimera=$CHIMERA_HOME/bin/chimera
# ligand preparation location of Autodock vina
prepare_ligand4=$CHIMERA_HOME/lib/python2.7/site-packages/AutoDockTools/Utilities24/prepare_ligand4.py

if (( $# != 2 )); then
        echo "Usage: ./mol2_to_pdbqt.sh mol2_folder pdbqt_folder"
        exit 1
fi

mol2_folder=$1
pdbqt_folder=$2

for f in `ls $mol2_folder/*.mol2`
do
        ligname=`basename $f | cut -d'.' -f1`
        ligname=$ligname".pdbqt"
        $chimera --nogui --nostatus --script "$prepare_ligand4 -l $f -o $pdbqt_folder/$ligname "
        echo $f " converted to " $pdbqt_folder/$ligname
done
