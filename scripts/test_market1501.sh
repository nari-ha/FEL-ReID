#!/bin/bash
#$ -l h_rt=1:0:0
#$ -l h_vmem=8G
#$ -pe smp 8
#$ -l gpu=1
#$ -cwd
#$ -j y
#$ -l rocky

set -e

# Replace the following line with a program or command
cd /data/home/ec23709/project/FEL-ReID
source fel-reid/bin/activate
python test_clipreid.py --config_file configs/person/msmt17.yml TEST.WEIGHT '/data/home/ec23709/project/FEL-ReID/output/market1501/RN50_120.pth'
python test_clipreid.py --config_file configs/person/person.yml TEST.WEIGHT '/data/home/ec23709/project/FEL-ReID/output/market1501/RN50_120.pth'
python test_clipreid.py --config_file configs/veri/veri.yml TEST.WEIGHT '/data/home/ec23709/project/FEL-ReID/output/market1501/RN50_120.pth'
python test_clipreid.py --config_file configs/multi/multi.yml TEST.WEIGHT '/data/home/ec23709/project/FEL-ReID/output/market1501/RN50_120.pth'

# Generated by Job Script Builder on 2025-03-07
# For assistance, please email its-research-support@qmul.ac.uk
# Please cite use of Apocrita in your Research
# See https://docs.hpc.qmul.ac.uk/using/citing/ for details