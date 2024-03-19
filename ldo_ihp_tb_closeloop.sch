v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 280 170 280 210 {
lab=iref}
N 770 60 770 80 {
lab=vss}
N -240 110 -240 140 {
lab=GND}
N 350 270 350 300 {
lab=vss}
N 280 270 280 300 {
lab=vss}
N -240 10 -240 50 {
lab=vss}
N 1020 220 1020 230 {
lab=pos}
N 1020 210 1020 220 {
lab=pos}
N 620 40 620 220 {
lab=pos}
N 620 40 690 40 {
lab=pos}
N 620 -0 690 0 {
lab=vcm}
N 830 20 980 20 {
lab=#net1}
N 1020 100 1020 150 {
lab=vout}
N 620 220 1020 220 {
lab=pos}
N 1020 50 1020 100 {
lab=vout}
N 1020 -100 1020 -10 {
lab=vdd}
N 750 -100 1020 -100 {
lab=vdd}
N 750 -100 750 -30 {
lab=vdd}
N 1020 20 1040 20 {
lab=vdd}
N 1040 -100 1040 20 {
lab=vdd}
N 1020 -100 1040 -100 {
lab=vdd}
N 730 80 730 100 {
lab=iref}
N 350 170 350 210 {
lab=vcm}
N 1240 100 1240 130 {
lab=vout}
N 1240 190 1240 210 {
lab=vss}
N 1020 290 1020 310 {
lab=vss}
N 1150 210 1240 210 {
lab=vss}
N 1020 100 1240 100 {
lab=vout}
C {devices/vsource.sym} 350 240 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -240 80 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 280 240 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} 350 300 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -240 140 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -240 10 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 770 80 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -370 -390 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} 620 0 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 280 300 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 1240 100 2 0 {name=p15 sig_type=std_logic lab=vout}
C {/foss/designs/ihp_design/ihp_ota_v2.sym} 750 20 0 0 {name=x1}
C {devices/code.sym} -50 -270 0 0 {name=SIMULATION1 only_toplevel=false 

value="


* Circuit Parameters
.param iref = 100u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m

.param w857 = 5u
.param l857 = 1u

.param wpar = 40u
.param lpar = 0.3u
.param mpar = 1

.param w34  = 50u
.param l34  = 1u
.param m34  = 1

.param w6   = 600u
.param l6   = 0.3u
.param m6   = 1

.param w7   = w857*18
.param w5   = w857*4

* Include Models
*.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

Vs vdd 0 1.8 AC 1

* OP Parameters & Singals to save
.save all

.control
tran 10n 1u
plot v(vout) v(pos) v(vcm)
.endc

*Simulation
.control
reset
  set color0 = white
  
  ac dec 100 1 10G
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

print @n.x1.xm2.nsg13_lv_nmos[vgs]-@n.x1.xm2.nsg13_lv_nmos[vth]
print @n.x1.xm2.nsg13_lv_nmos[vds]
print @n.x1.xm2.nsg13_lv_nmos[gm]

print @n.x1.xm3.nsg13_lv_pmos[vgs]-@n.x1.xm3.nsg13_lv_pmos[vth]
print @n.x1.xm3.nsg13_lv_pmos[vds]
print @n.x1.xm3.nsg13_lv_pmos[ids]

print @n.x1.xm4.nsg13_lv_pmos[vgs]-@n.x1.xm4.nsg13_lv_pmos[vth]
print @n.x1.xm4.nsg13_lv_pmos[vds]
print @n.x1.xm4.nsg13_lv_pmos[ids]

print v(vout)
print v(pos)

  setplot op1
  unset filetype
  write tb_opamp_openloop.raw

.endc

.end
"}
C {devices/res.sym} 1020 180 0 0 {name=R1
value=33.33k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 1020 260 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 1240 210 0 0 {name=p8 sig_type=std_logic lab=vss}
C {sg13g2_pr/sg13_lv_pmos.sym} 1000 20 0 0 {name=M1
L=0.45u
W=500.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 280 170 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 730 100 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 350 170 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 750 -100 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/res.sym} 1240 160 0 0 {name=R3
value=66k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 620 40 0 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 1020 310 0 0 {name=p3 sig_type=std_logic lab=vss}
