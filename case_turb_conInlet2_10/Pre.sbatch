#!/bin/bash
#SBATCH --job-name=Pre_mixer  # descriptivo, sino usa el nombre del script
#SBATCH --nodes=3
#SBATCH --tasks-per-node=4    ## ver si conviene lanzar 1 o 4 procesos por nodo
#SBATCH --output=log.pre-%j
#SBATCH --error=err.pre-%j
###SBATCH --mail-user=paire.cesar@gmail.com  --mail-type=END    #envia un mail al finalizar
### Para descomentar la línea anterior hay que dejarle un sólo numeral

## Las lineas siguientes son los comandos de bash a ejecutar
echo "Create case for $SLURM_NTASKS processors"
sed -i "s/numberOfSubdomains.*;/numberOfSubdomains $SLURM_NTASKS;/g" system/decomposeParDict
./Allrun.pre
sbatch -n $SLURM_NTASKS Job.sbatch
