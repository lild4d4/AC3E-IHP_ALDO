v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -340 90 -340 130 {
lab=iref}
N 150 -20 150 0 {
lab=vss}
N -860 30 -860 60 {
lab=GND}
N -270 190 -270 220 {
lab=vss}
N -340 190 -340 220 {
lab=vss}
N -860 -70 -860 -30 {
lab=vss}
N 400 140 400 150 {
lab=#net1}
N 400 130 400 140 {
lab=#net1}
N 0 -40 70 -40 {
lab=pos}
N 0 -80 70 -80 {
lab=vcm}
N 400 20 400 70 {
lab=vout}
N 0 140 400 140 {
lab=#net1}
N 400 -30 400 20 {
lab=vout}
N 400 -180 400 -90 {
lab=vdd}
N 130 -180 400 -180 {
lab=vdd}
N 130 -180 130 -110 {
lab=vdd}
N 400 -60 420 -60 {
lab=vdd}
N 420 -180 420 -60 {
lab=vdd}
N 400 -180 420 -180 {
lab=vdd}
N 110 0 110 20 {
lab=iref}
N -270 90 -270 130 {
lab=vcm}
N 400 210 400 230 {
lab=vss}
N 400 20 620 20 {
lab=vout}
N 0 100 0 140 {
lab=#net1}
N 0 0 0 40 {
lab=pos}
N -110 0 -110 30 {
lab=pos}
N -110 0 0 0 {
lab=pos}
N 0 -40 0 0 {
lab=pos}
N -110 90 -110 120 {
lab=vin}
N 210 -60 360 -60 {
lab=#net2}
C {devices/vsource.sym} -270 160 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -860 0 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} -340 160 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} -270 220 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -860 60 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -860 -70 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 150 0 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -990 -470 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} 0 -80 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -340 220 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 620 20 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/code.sym} -670 -350 0 0 {name=SIMULATION1 only_toplevel=false 

value="
.param R=18
R10 vout 0 \{R\}
*IL vout 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*CL vout 0 50p

.param iref = 5u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m

.param w857 = 6u
.param l857 = 2u

.param wpar = 15u
.param lpar = 2u
.param mpar = 1

.param w34  = 1.2u
.param l34  = 2u
.param m34  = 1

.param w6   = 100u
.param l6   = 0.3u
.param m6   = 1

.param w7   = w857*4
.param w5   = w857*1
* Include Models
*.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

Vs vdd 0 1.8
Vin vin 0 DC 0 AC 1

* OP Parameters & Singals to save
.save all

.control
tran 10n 1u
plot v(vout) v(pos) v(vcm)
.endc

*Simulation
.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi
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
print @n.x1.xm6.nsg13_lv_pmos[gm]/@n.x1.xm6.nsg13_lv_pmos[gds]
  
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
C {devices/res.sym} 400 100 0 0 {name=R1
value=33.33k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 400 180 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 380 -60 0 0 {name=M1
L=0.3u
W=15000.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} -340 90 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 110 20 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} -270 90 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 130 -180 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 0 -40 0 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 400 230 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/capa.sym} -110 60 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -110 120 0 0 {name=p4 sig_type=std_logic lab=vin}
C {/home/ac3e/Documents/ihp_design/ihp_ota_v3.sym} 130 -60 0 0 {name=x1}
C {devices/ind.sym} 0 70 0 0 {name=L2
m=1
value=10
footprint=1206
device=inductor}
