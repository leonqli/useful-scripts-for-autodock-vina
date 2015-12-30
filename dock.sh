#!/usr/bin/env bash

#vina location
vina=/usr/bin/vina

if (( $# != 5 )); then
        echo "Usage: ./dock.sh vina.conf receptor.pdbqt ligs_pdbqt_folder out_folder log_folder"
        exit 1
fi

conf=$1 # vina configuration file
rec=$2 # receptor file
pdbqt_folder=$3 # folder containing all ligands
out_folder=$4 # folder for docking results
log_folder=$5 # docking for docking logs

for lig in `ls $pdbqt_folder/*.pdbqt`
do
        echo "docking "$f"..."
        ligname=`basename $lig | cut -d'.' -f1`
        out=$out_folder/$ligname".out"
        log=$log_folder/$ligname".log"
        $vina --config $conf --receptor $rec --ligand $lig --out $out --log $log
done
