export SIMULATION_DIR=$(HOME_DIR)/simulations

export SCRIPTS_DIR ?= $(HOME_DIR)/python/monte_carlo
export CSV_DIR ?= $(SIMULATION_DIR)/csv
export FIG_DIR ?= $(SIMULATION_DIR)/fig

# Define the default target
.PHONY: all
all: figures

# ==============================================
#  _   _  ____ ____  ____ ___ ____ _____ 
# | \ | |/ ___/ ___||  _ \_ _/ ___| ____|
# |  \| | |  _\___ \| |_) | | |   |  _|  
# | |\  | |_| |___) |  __/| | |___| |___ 
# |_| \_|\____|____/|_|  |___\____|_____|
#                                        
# ==============================================

.PHONY: ngspice_run
ngspice_run: $(CSV_DIR)/mc_ldo_psrr.csv $(CSV_DIR)/mc_ldo_pm.csv

$(CSV_DIR)/mc_ldo_psrr.csv: 
	ngspice -b $(SIMULATION_DIR)/mc_ldo_ihp_v3_tb_closeloop.spice
	
$(CSV_DIR)/mc_ldo_pm.csv: 
	ngspice -b $(SIMULATION_DIR)/mc_ldo_ihp_v3_tb_openloop.spice

# ==============================================
#  _____ ___ ____ _   _ ____  _____ ____  
# |  ___|_ _/ ___| | | |  _ \| ____/ ___| 
# | |_   | | |  _| | | | |_) |  _| \___ \ 
# |  _|  | | |_| | |_| |  _ <| |___ ___) |
# |_|   |___\____|\___/|_| \_\_____|____/
#
# ==============================================

.PHONY: figures
figures: 	$(FIG_DIR)/mc_ldo_psrr.png	\
		$(FIG_DIR)/mc_ldo_dropout.png 	\
		$(FIG_DIR)/mc_ldo_line_reg.png 	\
		$(FIG_DIR)/mc_ldo_load_reg.png 	\
		$(FIG_DIR)/mc_ldo_pm.png 	\
		$(FIG_DIR)/mc_ldo_olgain.png

$(FIG_DIR)/mc_ldo_psrr.png: $(CSV_DIR)/mc_ldo_psrr.csv $(SCRIPTS_DIR)/MC_ldo_psrr.py
	python3 $(SCRIPTS_DIR)/MC_ldo_psrr.py $(CSV_DIR)/mc_ldo_psrr.csv $(FIG_DIR)/mc_ldo_psrr.png
	
$(FIG_DIR)/mc_ldo_dropout.png: $(CSV_DIR)/mc_ldo_dropout.csv $(SCRIPTS_DIR)/MC_ldo_dropout.py
	python3 $(SCRIPTS_DIR)/MC_ldo_dropout.py $(CSV_DIR)/mc_ldo_dropout.csv $(FIG_DIR)/mc_ldo_dropout.png
	
$(FIG_DIR)/mc_ldo_line_reg.png: $(CSV_DIR)/mc_ldo_line_reg.csv $(SCRIPTS_DIR)/MC_ldo_line_reg.py
	python3 $(SCRIPTS_DIR)/MC_ldo_line_reg.py $(CSV_DIR)/mc_ldo_line_reg.csv $(FIG_DIR)/mc_ldo_line_reg.png
	
$(FIG_DIR)/mc_ldo_load_reg.png: $(CSV_DIR)/mc_ldo_load_reg.csv $(SCRIPTS_DIR)/MC_ldo_load_reg.py
	python3 $(SCRIPTS_DIR)/MC_ldo_load_reg.py $(CSV_DIR)/mc_ldo_load_reg.csv $(FIG_DIR)/mc_ldo_load_reg.png
	
$(FIG_DIR)/mc_ldo_pm.png: $(CSV_DIR)/mc_ldo_pm.csv $(SCRIPTS_DIR)/MC_ldo_pm.py
	python3 $(SCRIPTS_DIR)/MC_ldo_pm.py $(CSV_DIR)/mc_ldo_pm.csv $(FIG_DIR)/mc_ldo_pm.png

$(FIG_DIR)/mc_ldo_olgain.png: $(CSV_DIR)/mc_ldo_olgain.csv $(SCRIPTS_DIR)/MC_ldo_olgain.py
	python3 $(SCRIPTS_DIR)/MC_ldo_olgain.py $(CSV_DIR)/mc_ldo_olgain.csv $(FIG_DIR)/mc_ldo_olgain.png
	
	
	
.PHONY: clean
clean: 
	rm -d -r simulations/
	rm -d -r ngspice/
	rm -d -r netlist/
	rm -d -r results/
	rm -d -r gds/
