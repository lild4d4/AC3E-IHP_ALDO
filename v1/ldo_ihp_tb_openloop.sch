v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -340 110 -340 150 {
lab=iref}
N 150 0 150 20 {
lab=vss}
N -860 50 -860 80 {
lab=GND}
N -270 210 -270 240 {
lab=vss}
N -340 210 -340 240 {
lab=vss}
N -860 -50 -860 -10 {
lab=vss}
N 400 160 400 170 {
lab=#net1}
N 400 150 400 160 {
lab=#net1}
N 0 -20 70 -20 {
lab=pos}
N 0 -60 70 -60 {
lab=vcm}
N 210 -40 360 -40 {
lab=#net2}
N 400 40 400 90 {
lab=vout}
N 0 160 400 160 {
lab=#net1}
N 400 -10 400 40 {
lab=vout}
N 400 -160 400 -70 {
lab=vdd}
N 130 -160 400 -160 {
lab=vdd}
N 130 -160 130 -90 {
lab=vdd}
N 400 -40 420 -40 {
lab=vdd}
N 420 -160 420 -40 {
lab=vdd}
N 400 -160 420 -160 {
lab=vdd}
N 110 20 110 40 {
lab=iref}
N -270 110 -270 150 {
lab=vcm}
N 620 40 620 70 {
lab=vout}
N 620 130 620 150 {
lab=vss}
N 400 230 400 250 {
lab=vss}
N 530 150 620 150 {
lab=vss}
N 530 40 620 40 {
lab=vout}
N 530 130 530 150 {
lab=vss}
N 530 40 530 70 {
lab=vout}
N 400 40 530 40 {
lab=vout}
N 0 120 -0 160 {
lab=#net1}
N 0 20 0 60 {
lab=pos}
N -110 20 -110 50 {
lab=pos}
N -110 20 0 20 {
lab=pos}
N 0 -20 0 20 {
lab=pos}
N -110 110 -110 140 {
lab=vin}
C {devices/vsource.sym} -270 180 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -860 20 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} -340 180 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} -270 240 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -860 80 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -860 -50 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 150 20 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -990 -450 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} 0 -60 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -340 240 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 620 40 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/code.sym} -670 -330 0 0 {name=SIMULATION1 only_toplevel=false 

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

.param w6   = 400u
.param l6   = 0.3u
.param m6   = 1

.param w7   = w857*18
.param w5   = w857*4

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
C {devices/res.sym} 400 120 0 0 {name=R1
value=33.33k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 400 200 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 620 150 0 0 {name=p8 sig_type=std_logic lab=vss}
C {sg13g2_pr/sg13_lv_pmos.sym} 380 -40 0 0 {name=M1
L=0.3u
W=9000.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} -340 110 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 110 40 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} -270 110 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 130 -160 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/res.sym} 620 100 0 0 {name=R3
value=66k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 0 -20 0 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 400 250 0 0 {name=p3 sig_type=std_logic lab=vss}
C {/home/ac3e/Documents/ihp_design/ihp_ota_v2.sym} 130 -40 0 0 {name=x1}
C {devices/capa.sym} 530 100 0 0 {name=C1
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 0 90 0 0 {name=R4
value=1G
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -110 80 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -110 140 0 0 {name=p4 sig_type=std_logic lab=vin}
