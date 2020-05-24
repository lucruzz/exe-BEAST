#!/bin/bash
#SBATCH --nodes=1               #Numero de Nós
#SBATCH --ntasks-per-node=1     #Numero de tarefas por Nó
#SBATCH --ntasks=1              #Numero de tarefas
#SBATCH -p cpu_dev              #Fila (partition) a ser utilizada
#SBATCH -J JOB_BEAST            #Nome job

#Carregar os módulos
module load python/3.8.2
#pip3 install --user parsl
module load beagle/current
module load beast/1.10
module load java/jdk-8u201

#Acessar o diretório onde o script está localizado
cd /scratch/cenapadrjsd/lucas.silva/beast

EXEC=/scratch/cenapadrjsd/lucas.silva/beast/beast.py

#Executa o script
time python3 $EXEC
