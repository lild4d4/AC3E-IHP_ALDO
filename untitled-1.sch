v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 120 140 160 {
lab=iref}
N 630 10 630 30 {
lab=vss}
N -380 60 -380 90 {
lab=GND}
N 210 220 210 250 {
lab=vss}
N 140 220 140 250 {
lab=vss}
N -380 -40 -380 0 {
lab=vss}
N 880 170 880 180 {
lab=pos}
N 880 160 880 170 {
lab=pos}
N 480 -10 480 170 {
lab=pos}
N 690 -30 840 -30 {
lab=#net1}
N 880 50 880 100 {
lab=vout}
N 480 170 880 170 {
lab=pos}
N 880 0 880 50 {
lab=vout}
N 880 -150 880 -60 {
lab=vdd}
N 610 -150 880 -150 {
lab=vdd}
N 610 -150 610 -80 {
lab=vdd}
N 880 -30 900 -30 {
lab=vdd}
N 900 -150 900 -30 {
lab=vdd}
N 880 -150 900 -150 {
lab=vdd}
N 590 30 590 50 {
lab=iref}
N 210 120 210 160 {
lab=vcm}
N 1100 50 1100 80 {
lab=vout}
N 1100 140 1100 160 {
lab=vss}
N 880 240 880 260 {
lab=vss}
N 880 50 1100 50 {
lab=vout}
N 480 -50 550 -10 {
lab=vcm}
N 480 -10 550 -50 {
lab=pos}
C {devices/vsource.sym} 210 190 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -380 30 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 140 190 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} 210 250 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -380 90 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -380 -40 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 630 30 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -510 -440 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} 480 -50 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 140 250 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 1100 50 2 0 {name=p15 sig_type=std_logic lab=vout}
C {/foss/designs/ihp_design/ihp_ota_v2.sym} 610 -30 0 0 {name=x1}
C {devices/code.sym} -190 -320 0 0 {name=SIMULATION1 only_toplevel=false 

value="


* Circuit Parameters
.param iref = 100u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m

.param w857 = 5u
.param l857 = 1u

.param wpar = 50u
.param lpar = 0.3u
.param mpar = 1

.param w34  = 100u
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
C {devices/res.sym} 880 130 0 0 {name=R1
value=33.33k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 880 210 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 1100 160 0 0 {name=p8 sig_type=std_logic lab=vss}
C {sg13g2_pr/sg13_lv_pmos.sym} 860 -30 0 0 {name=M1
L=1.5u
W=900.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 140 120 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 590 50 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 210 120 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 610 -150 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 480 -10 0 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 880 260 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/isource.sym} 1100 110 0 0 {name=I1 value=1m}
