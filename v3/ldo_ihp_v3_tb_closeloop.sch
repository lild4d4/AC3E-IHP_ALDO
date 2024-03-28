v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 160 260 160 300 {
lab=iref}
N 270 -30 270 -10 {
lab=vss}
N 410 360 410 390 {
lab=GND}
N 230 360 230 390 {
lab=vss}
N 160 360 160 390 {
lab=vss}
N 410 260 410 300 {
lab=vss}
N 520 130 520 140 {
lab=pos}
N 520 120 520 130 {
lab=pos}
N 120 -50 120 130 {
lab=pos}
N 120 -50 190 -50 {
lab=pos}
N 120 -90 190 -90 {
lab=vcm}
N 520 10 520 60 {
lab=#net1}
N 120 130 520 130 {
lab=pos}
N 520 -40 520 10 {
lab=#net1}
N 520 -190 520 -100 {
lab=vdd}
N 250 -190 520 -190 {
lab=vdd}
N 520 -70 540 -70 {
lab=vdd}
N 540 -190 540 -70 {
lab=vdd}
N 520 -190 540 -190 {
lab=vdd}
N 230 -10 230 10 {
lab=iref}
N 230 260 230 300 {
lab=vcm}
N 520 200 520 220 {
lab=vss}
N 520 10 590 10 {
lab=#net1}
N 250 -130 250 -120 {
lab=#net2}
N 330 -70 480 -70 {
lab=#net3}
N 650 10 740 10 {
lab=vout}
N 740 10 740 40 {
lab=vout}
N 740 100 740 140 {
lab=#net4}
N 740 200 740 220 {
lab=vss}
C {devices/vsource.sym} 230 330 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} 410 330 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 160 330 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} 230 390 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} 410 390 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 410 260 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 270 -10 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -850 440 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} 120 -90 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 160 390 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 740 10 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/code.sym} -890 -370 0 0 {name=Simulation_parameters only_toplevel=true

value="

Vs vdd 0 1.8 AC 1
.save all

"}
C {devices/res.sym} 520 90 0 0 {name=R1
value=33.33k
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 520 170 0 0 {name=R2
value=100k
footprint=1206
device=resistor
m=1}
C {sg13g2_pr/sg13_lv_pmos.sym} 500 -70 0 0 {name=M1
L=0.25u
W=13000.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/lab_pin.sym} 160 260 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 230 10 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 230 260 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 250 -190 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 120 -50 0 0 {name=p1 sig_type=std_logic lab=pos}
C {devices/lab_pin.sym} 520 220 0 0 {name=p3 sig_type=std_logic lab=vss}
C {/home/ac3e/Documents/ihp_design/ihp_ota_v3.sym} 250 -70 0 0 {name=x1}
C {devices/ammeter.sym} 620 10 3 0 {name=Vmeas savecurrent=true}
C {devices/ammeter.sym} 250 -160 0 0 {name=Vmeas1 savecurrent=true}
C {devices/code.sym} -660 -370 0 0 {name=Load_parameters only_toplevel=false 

value="

.param R=18
R10 vout 0 \{R\}
IL vout 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*CL vout 0 50p

"}
C {devices/code.sym} -460 -370 0 0 {name=OTA_parameters only_toplevel=false 

value="

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

.param w34  = 2u
.param l34  = 1u
.param m34  = 1

.param w6   = 20u
.param l6   = 0.5u
.param m6   = 1

.param w7   = w857*4
.param w5   = w857*1

"}
C {devices/code.sym} -900 -150 0 0 {name=Transient_simulation only_toplevel=false 

value="

.control
reset
save all
set color0 = white
tran 1n 1u
plot v(vout) v(pos) v(vcm)
plot i(vmeas1)
write ldo_ihp_v3_tb_closeloop_tran.raw
.endc

.end
"}
C {devices/code.sym} -700 -150 0 0 {name=Line_reg_&_Dropout only_toplevel=false 

value="

.control
reset
save all
dc Vs 2.1 0 -0.01
plot v(vout) v(pos) v(vcm) v(vdd)
meas dc V_ldo_1.6 FIND v(vout) WHEN v(vdd)=1.6
meas dc V_ldo_2 FIND v(vout) WHEN v(vdd)=2
print (V_ldo_1.6-V_ldo_2)/0.4
write ldo_ihp_v3_tb_closeloop_dc.raw
.endc

.end
"}
C {devices/code.sym} -500 -150 0 0 {name=PSRR_simulation only_toplevel=false 

value="

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
C {devices/code.sym} -900 30 0 0 {name=Load_reg only_toplevel=false 

value="

.control
reset
alter IL 50u
alter R10 3600k
tran 0.1u 100u
meas TRAN V_ldo_100u FIND v(vout) AT=5u
meas TRAN V_ldo_10m FIND v(vout) AT=100u
let load_reg= V_ldo_100u-V_ldo_10m
let load_current =(-1*i(Vs)-131.8e-6)
print load_reg/9.9
plot i(Vmeas) v(vout)-1.2
.endc

.end
"}
C {devices/code.sym} -700 30 0 0 {name=settling_time only_toplevel=false 

value="

.control
alter R10 36k
reset
alter @IL[pwl]=[ 0 0 10u 0 20u 0 30u 0 ]
alter @Vs[pulse]=[ 1.8 1.6 50u 1u 1u 10u 100u ]
alter IL 0
tran 0.1u 100u
plot v(vdd) v(vout)
write ldo_ihp_v3_tb_closeloop.raw
.endc


.end
"}
C {devices/capa.sym} 740 170 0 0 {name=C1
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 740 70 0 0 {name=R3
value=2
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 740 220 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/title.sym} -670 570 0 0 {name=l2 author="Daniel Arevalos"}
