v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 -40 290 -40 {
lab=vcm}
N 250 -40 250 40 {
lab=vcm}
N 330 0 330 40 {
lab=#net1}
N 370 -20 370 0 {
lab=vss}
N 350 -130 350 -110 {
lab=vdd}
N 430 -60 480 -60 {
lab=vout}
N 480 -170 480 -60 {
lab=vout}
N -260 40 -260 70 {
lab=GND}
N -160 40 -160 70 {
lab=vss}
N -20 180 -20 210 {
lab=vcm}
N 250 100 250 130 {
lab=vss}
N 330 100 330 130 {
lab=vss}
N -70 -80 -55 -80 {
lab=vcm}
N -20 30 -20 40 {
lab=vin}
N -20 100 -20 120 {
lab=vsen}
N 360 -170 480 -170 {
lab=vout}
N -160 -60 -160 -20 {
lab=vdd}
N -260 -60 -260 -20 {
lab=vss}
N 480 50 480 75 {
lab=vss}
N 480 -60 480 -10 {
lab=vout}
N 40 -170 300 -170 {
lab=#net2}
N 40 -170 40 -80 {
lab=#net2}
N 10 -80 40 -80 {
lab=#net2}
N 40 -80 90 -80 {
lab=#net2}
N 140 -80 290 -80 {
lab=vin}
C {devices/vsource.sym} 250 70 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -20 150 0 0 {name=V2 value="sin(0 \{vac\} 1Meg) dc 0 ac 1" savecurrent=false}
C {devices/vsource.sym} -160 10 0 0 {name=V4 value=DC\{vdd\} savecurrent=false}
C {devices/vsource.sym} -260 10 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 330 70 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} -20 210 0 0 {name=p1 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 250 130 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -260 70 0 0 {name=l1 lab=GND}
C {devices/res.sym} -25 -80 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -20 70 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 330 -170 1 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -260 -60 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -160 -60 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 350 -130 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 270 -40 0 0 {name=p8 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 370 0 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/capa.sym} 480 20 0 0 {name=C3
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 480 75 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -390 -460 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} -20 110 0 0 {name=p11 sig_type=std_logic lab=vsen}
C {devices/lab_pin.sym} 260 -80 0 0 {name=p13 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 330 130 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 480 -60 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} -160 70 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/res.sym} 115 -80 1 0 {name=R3
value=1G
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -70 -80 0 0 {name=p12 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -20 30 0 0 {name=p16 sig_type=std_logic lab=vin}
C {devices/code.sym} -70 -340 0 0 {name=SIMULATION1 only_toplevel=false 

value="


.param iref = 100u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m

.param w857 = 2u
.param l857 = 0.4u

.param wpar = 300u
.param lpar = 0.4u
.param mpar = 1

.param w34  = 100u
.param l34  = 0.4u
.param m34  = 1

.param w6   = 750u
.param l6   = 0.35u
.param m6   = 1

.param w7   = w857*9
.param w5   = w857*2


* Include Models
*.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

* OP Parameters & Singals to save
.save all

*Simulation
.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi
  set color0 = white
  
  ac dec 100 1000 10G
  setplot ac1
  meas ac GBW when vdb(vout)=0
  meas ac DCG find vdb(vout) at=1
  meas ac PM find vp(vout) when vdb(vout)=0
  print PM*180/PI
  meas ac GM find vdb(vout) when vp(vout)=0
  plot vdb(vout) \{vp(vout)*180/PI\}
  write tb_opamp_openloop_ac1.raw

  reset
  op


print @n.x1.xm8.nsg13_lv_nmos[vgs]-@n.x1.xm8.nsg13_lv_nmos[vth]
print @n.x1.xm8.nsg13_lv_nmos[vds]

print @n.x1.XM7.nsg13_lv_nmos[vgs]-@n.x1.XM7.nsg13_lv_nmos[vth]
print @n.x1.XM7.nsg13_lv_nmos[vds]
print @n.x1.XM7.nsg13_lv_nmos[ids]

print @n.x1.xm6.nsg13_lv_pmos[vgs]-@n.x1.xm6.nsg13_lv_pmos[vth]
print @n.x1.xm6.nsg13_lv_pmos[vds]
print @n.x1.xm6.nsg13_lv_pmos[gm]
print @n.x1.xm6.nsg13_lv_pmos[gm]/@n.x1.xm6.nsg13_lv_pmos[ids]
  
print @n.x1.xm5.nsg13_lv_nmos[vgs]-@n.x1.xm5.nsg13_lv_nmos[vth]
print @n.x1.xm5.nsg13_lv_nmos[vds]
print @n.x1.xm5.nsg13_lv_nmos[ids]

print @n.x1.xm1.nsg13_lv_nmos[vgs]-@n.x1.xm1.nsg13_lv_nmos[vth]
print @n.x1.xm1.nsg13_lv_nmos[vds]
print @n.x1.xm1.nsg13_lv_nmos[gm]
print @n.x1.xm1.nsg13_lv_nmos[gm]/@n.x1.xm1.nsg13_lv_nmos[ids]

print @n.x1.xm2.nsg13_lv_nmos[vgs]-@n.x1.xm2.nsg13_lv_nmos[vth]
print @n.x1.xm2.nsg13_lv_nmos[vds]
print @n.x1.xm2.nsg13_lv_nmos[gm]

print @n.x1.xm3.nsg13_lv_pmos[vgs]-@n.x1.xm3.nsg13_lv_pmos[vth]
print @n.x1.xm3.nsg13_lv_pmos[vds]
print @n.x1.xm3.nsg13_lv_pmos[ids]

print @n.x1.xm4.nsg13_lv_pmos[vgs]-@n.x1.xm4.nsg13_lv_pmos[vth]
print @n.x1.xm4.nsg13_lv_pmos[vds]
print @n.x1.xm4.nsg13_lv_pmos[ids]

  setplot op1
  unset filetype
  write tb_opamp_openloop.raw

.endc

.end
"}
C {/home/ac3e/Documents/ihp_design/ihp_ota_v2.sym} 350 -60 0 0 {name=x1}
