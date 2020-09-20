#!/bin/bash
#SBATCH --job-name=mixer  # descriptivo, sino usa el nombre del script
#SBATCH --nodes=2
#SBATCH --tasks-per-node=4    ## ver si conviene lanzar 1 o 4 procesos por nodo
#SBATCH --output=log.mixer-%j
#SBATCH --error=err.mixer-%j
###SBATCH --mail-user=paire.cesar@gmail.com  --mail-type=END    #envia un mail al finalizar
### Para descomentar la línea anterior hay que dejarle un sólo numeral

## Las lineas siguientes son los comandos de bash a ejecutar
mpirun -np $SLURM_NTASKS pimpleFoam -parallel
