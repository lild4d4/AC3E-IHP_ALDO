import sys
import os
import subprocess

home_dir = os.environ['HOME_DIR']
pdk_root = os.environ['PDK_ROOT']
pdk = os.environ['PDK']
sch_dir = os.path.join(home_dir, 'xschem/ota')
simulations_path = os.path.join(sch_dir, 'simulations')

sys.path.append('/home/ac3e/Documents/ihp_design/python')

from sim_script import get_netlist, simulate, open_xschem
from sim_plot import plot

if not os.path.exists(simulations_path):
    os.makedirs(simulations_path)

simulations = ['ota_tb_openloop']
for sim in simulations:
	print("Generating "+sim+" netlist from schematic")
	get_netlist(pdk_root, pdk, sim+'.sch', simulations_path, 0)	
	
for sim in simulations:
	print("Simulating "+sim+" with nspice")
	simulate(simulations_path, sim+'.spice')

plot(simulations_path+'/ota_tb_openloop_ac.csv', home_dir+'/results/fig', 'vdb(vout) Phase', 'log')

open_xschem(pdk_root, pdk, 'ota_tb_openloop.sch', 0)
