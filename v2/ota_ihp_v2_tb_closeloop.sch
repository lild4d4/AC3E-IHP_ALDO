v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 230 20 270 20 {
lab=vcm}
N 230 20 230 100 {
lab=vcm}
N 310 60 310 100 {
lab=#net1}
N 350 40 350 60 {
lab=vss}
N 330 -70 330 -50 {
lab=vdd}
N 410 0 460 0 {
lab=vout}
N 460 -110 460 0 {
lab=vout}
N 170 -20 170 20 {
lab=vin}
N 170 -20 270 -20 {
lab=vin}
N -440 100 -440 130 {
lab=GND}
N -340 100 -340 130 {
lab=vss}
N -90 130 -90 160 {
lab=vcm}
N 230 160 230 190 {
lab=vss}
N 310 160 310 190 {
lab=vss}
N 170 80 170 110 {
lab=vss}
N -90 -20 -75 -20 {
lab=#net2}
N -90 -20 -90 -10 {
lab=#net2}
N -90 50 -90 70 {
lab=vsen}
N 340 -110 460 -110 {
lab=vout}
N -340 0 -340 40 {
lab=vdd}
N -440 0 -440 40 {
lab=vss}
N 460 110 460 135 {
lab=vss}
N 460 0 460 50 {
lab=vout}
N 20 -110 280 -110 {
lab=vin}
N 20 -110 20 -20 {
lab=vin}
N -10 -20 20 -20 {
lab=vin}
N 20 -20 170 -20 {
lab=vin}
C {devices/vsource.sym} 230 130 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -90 100 0 0 {name=V2 value="sin(0 \{vac\} 1Meg) dc 0 ac 1" savecurrent=false}
C {devices/vsource.sym} -340 70 0 0 {name=V4 value=DC\{vdd\} savecurrent=false}
C {devices/vsource.sym} -440 70 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 310 130 2 0 {name=I0 value=DC\{iref\}}
C {devices/capa.sym} 170 50 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -90 160 0 0 {name=p1 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 230 190 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 170 110 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -440 130 0 0 {name=l1 lab=GND}
C {devices/res.sym} -45 -20 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -90 20 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 310 -110 1 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -440 0 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -340 0 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 330 -70 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 250 20 0 0 {name=p8 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 350 60 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/capa.sym} 460 80 0 0 {name=C3
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 460 135 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -410 -400 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} -90 60 0 0 {name=p11 sig_type=std_logic lab=vsen}
C {devices/lab_pin.sym} 240 -20 0 0 {name=p13 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 310 190 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 460 0 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} -340 130 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/code.sym} -90 -280 0 0 {name=SIMULATION1 only_toplevel=false 

value="


* Circuit Parameters
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
.options TEMP = 125.0

* Include Models
*.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

* OP Parameters & Singals to save
.save all

*Simulation
.control
  set color0 = white
  
  ac dec 100 1 10G
  setplot ac1
  meas ac GBW when vdb(vout)=0
  meas ac DCG find vdb(vout) at=1]]
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
  
print @n.x1.xm5.nsg13_lv_nmos[vgs]-@n.x1.xm5.nsg13_lv_nmos[vth]
print @n.x1.xm5.nsg13_lv_nmos[vds]
print @n.x1.xm5.nsg13_lv_nmos[ids]

print @n.x1.xm1.nsg13_lv_nmos[vgs]-@n.x1.xm1.nsg13_lv_nmos[vth]
print @n.x1.xm1.nsg13_lv_nmos[vds]
print @n.x1.xm1.nsg13_lv_nmos[gm]

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
C {/home/ac3e/Documents/ihp_design/ihp_ota_v2.sym} 330 0 0 0 {name=x1}
