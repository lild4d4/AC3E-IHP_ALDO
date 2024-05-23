v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {
}
E {}
B 2 690 -440 1490 -40 {flags=graph,unlocked
y1=0.64875
y2=1.54875
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.4802712e-07
x2=1.1480271e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vout
pos
vcm
vdd"
color="7 8 12 4"
dataset=0
unitx=1
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/ldo_ihp_v3_tb_closeloop_tran.raw}
B 2 690 -40 1490 360 {flags=graph,unlocked
y1=-1.18
y2=2.92
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1

x2=1.5134402e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vdd
vcm
pos
vout"
color="12 8 10 7"

unitx=1
logx=0
logy=0
sim_type=dc
rawfile=$netlist_dir/ldo_ihp_v3_tb_closeloop_dc.raw

dataset=0
rainbow=0
x1=5.1344019e-07}
B 2 1610 -440 2410 -40 {flags=graph,unlocked


ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1

x2=1.1134402e-06
divx=5
subdivx=8
xlabmag=1.0
ylabmag=1.0
node="\\"vout db20()\\""
color=4

unitx=1
logx=1
logy=0
sim_type=ac
rawfile=$netlist_dir/ldo_ihp_v3_tb_closeloop_ac.raw
dataset=-1

y1=-73
y2=-4.4
x1=1.1344019e-07}
B 2 1610 -40 2410 360 {flags=graph,unlocked
y1=-0.009448
y2=0.001912
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.1344019e-07
x2=1.1134402e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="\\"i(Vmeas)\\"
\\"v(vout) 1.2 -\\""
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/ldo_ihp_v3_tb_closeloop_load.raw
hilight_wave=0}
B 2 1605 360 2405 760 {flags=graph,unlocked
y1=1.2
y2=1.8
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=1.1344019e-07
x2=1.1134402e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="vdd
vout"
color="4 7"
dataset=-1
unitx=1
logx=0
logy=0
sim_type=tran
rawfile=$netlist_dir/ldo_ihp_v3_tb_closeloop_settime.raw
digital=0
rainbow=0}
T {Off-Chip Compensation
} 230 260 3 0 0.4 0.4 {}
N -210 210 -210 250 {
lab=iref}
N -40 310 -40 340 {
lab=GND}
N -140 310 -140 340 {
lab=vss}
N -210 310 -210 340 {
lab=vss}
N -40 210 -40 250 {
lab=vss}
N -140 210 -140 250 {
lab=vcm}
N 210 0 300 0 {
lab=vout}
N 300 0 300 30 {
lab=vout}
N 300 90 300 130 {
lab=#net1}
N 300 190 300 210 {
lab=vss}
N -160 -20 -140 -20 {
lab=#net2}
N -240 -20 -220 -20 {
lab=vdd}
N -240 0 -140 0 {
lab=iref}
N -240 20 -140 20 {
lab=vcm}
N -10 60 -10 90 {
lab=vss}
N 110 0 150 0 {
lab=#net3}
N 390 0 390 70 {
lab=vout}
N 300 0 390 0 {
lab=vout}
N 390 130 390 210 {
lab=vss}
N 460 0 460 70 {
lab=vout}
N 390 0 460 0 {
lab=vout}
N 460 130 460 210 {
lab=vss}
C {devices/vsource.sym} -140 280 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -40 280 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} -210 280 2 0 {name=I0 value=DC\{iref\}}
C {devices/lab_pin.sym} -140 340 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -40 340 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -40 210 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -10 90 3 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -990 -340 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif
"}
C {devices/lab_pin.sym} -240 20 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -210 340 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 460 0 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/code.sym} -990 -70 0 0 {name=Simulation_parameters only_toplevel=true

value="

Vs vdd 0 1.8 AC 1
.param temp=27
.save all

.param iref = 5u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m

"}
C {devices/lab_pin.sym} -210 210 0 0 {name=p12 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} -240 0 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} -140 210 0 0 {name=p18 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -240 -20 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/ammeter.sym} 180 0 3 0 {name=Vmeas savecurrent=true}
C {devices/ammeter.sym} -190 -20 3 0 {name=Vmeas1 savecurrent=true}
C {devices/code.sym} -790 -70 0 0 {name=Load_parameters only_toplevel=false 

value="

.param R=12
*R10 vout 0 \{R\}
IL vout 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*CL vout 0 50p

"}
C {devices/code.sym} -990 100 0 0 {name=Transient_simulation only_toplevel=false 

value="

.control
reset
save all
set color0 = white
tran 1n 1u
plot v(vout) v(pos) v(vcm)
plot i(v.x2.vmeas1)
print @n.x2.xm1.nsg13_lv_pmos[vgs]
print @n.x2.xm1.nsg13_lv_pmos[vth]
print @n.x2.xm1.nsg13_lv_pmos[vgs]-@n.x2.xm1.nsg13_lv_pmos[vth]
print @n.x2.xm1.nsg13_lv_pmos[vds]
print @n.x2.xm1.nsg13_lv_pmos[gm]
write ldo_ihp_v3_tb_closeloop_tran.raw

.endc

.control
reset

tran 1e-6 1e-3
write test_tran.raw 
noise v(vout) Vs dec 10 100 100e3
print inoise_total onoise_total
setplot noise1
plot onoise_spectrum
.endc

.end
"}
C {devices/code.sym} -790 100 0 0 {name=Line_reg_&_Dropout only_toplevel=false 

value="

.control
reset
save all
dc Vs 0 2.1 0.01
plot v(vout) v(vcm) v(vdd)
meas dc V_ldo_1.6 FIND v(vout) WHEN v(vdd)=1.6
meas dc V_ldo_2 FIND v(vout) WHEN v(vdd)=2 
print (V_ldo_1.6-V_ldo_2)/0.4

plot deriv(vout)
let der = deriv(vout)

meas dc V_ldo_vdropout FIND v(vdd) WHEN der=0.02 CROSS=LAST
print V_ldo_vdropout-1.2

write ldo_ihp_v3_tb_closeloop_dc.raw
.endc

.end
"}
C {devices/code.sym} -590 100 0 0 {name=PSRR_simulation only_toplevel=false 

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
  write ldo_ihp_v3_tb_closeloop_ac.raw

  reset
  op


print @n.x1.x1.xm8.nsg13_lv_nmos[vgs]-@n.x1.x1.xm8.nsg13_lv_nmos[vth]
print @n.x1.x1.xm8.nsg13_lv_nmos[vds]

print @n.x1.x1.XM7.nsg13_lv_nmos[vgs]-@n.x1.x1.XM7.nsg13_lv_nmos[vth]
print @n.x1.x1.XM7.nsg13_lv_nmos[vds]
print @n.x1.x1.XM7.nsg13_lv_nmos[ids]

print @n.x1.x1.xm6.nsg13_lv_pmos[vgs]-@n.x1.x1.xm6.nsg13_lv_pmos[vth]
print @n.x1.x1.xm6.nsg13_lv_pmos[vds]
print @n.x1.x1.xm6.nsg13_lv_pmos[gm]
print @n.x1.x1.xm6.nsg13_lv_pmos[gm]/@n.x1.x1.xm6.nsg13_lv_pmos[ids]
print @n.x1.x1.xm6.nsg13_lv_pmos[ids]
  
print @n.x1.x1.xm5.nsg13_lv_nmos[vgs]-@n.x1.x1.xm5.nsg13_lv_nmos[vth]
print @n.x1.x1.xm5.nsg13_lv_nmos[vds]
print @n.x1.x1.xm5.nsg13_lv_nmos[ids]

print @n.x1.x1.xm1.nsg13_lv_nmos[vgs]-@n.x1.x1.xm1.nsg13_lv_nmos[vth]
print @n.x1.x1.xm1.nsg13_lv_nmos[vds]
print @n.x1.x1.xm1.nsg13_lv_nmos[gm]

print @n.x1.x1.xm2.nsg13_lv_nmos[vgs]-@n.x1.x1.xm2.nsg13_lv_nmos[vth]
print @n.x1.x1.xm2.nsg13_lv_nmos[vds]
print @n.x1.x1.xm2.nsg13_lv_nmos[gm]

print @n.x1.x1.xm3.nsg13_lv_pmos[vgs]-@n.x1.x1.xm3.nsg13_lv_pmos[vth]
print @n.x1.x1.xm3.nsg13_lv_pmos[vds]
print @n.x1.x1.xm3.nsg13_lv_pmos[ids]

print @n.x1.x1.xm4.nsg13_lv_pmos[vgs]-@n.x1.x1.xm4.nsg13_lv_pmos[vth]
print @n.x1.x1.xm4.nsg13_lv_pmos[vds]
print @n.x1.x1.xm4.nsg13_lv_pmos[ids]

print v(vout)
print v(pos)

  setplot op1
  unset filetype
  write tb_opamp_openloop.raw

.endc

.end
"}
C {devices/code.sym} -990 250 0 0 {name=Load_reg only_toplevel=false 

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
write ldo_ihp_v3_tb_closeloop_load.raw
.endc

.end
"}
C {devices/code.sym} -790 250 0 0 {name=settling_time only_toplevel=false 

value="

.control
alter R10 36k
reset
alter @IL[pwl]=[ 0 0 10u 0 20u 0 30u 0 ]
alter @Vs[pulse]=[ 1.8 1.6 50u 1u 1u 10u 100u ]
alter IL 0
tran 0.1u 100u
plot v(vdd) v(vout)
write ldo_ihp_v3_tb_closeloop_settime.raw
.endc


.end
"}
C {devices/capa.sym} 300 160 0 0 {name=Cc
m=1
value=1u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 300 60 0 0 {name=Resr
value=2
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 300 210 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/title.sym} -790 560 0 0 {name=l2 author="Daniel Arevalos"}
C {devices/launcher.sym} 750 530 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/ldo_ihp_v3_tb_closeloop_tran.raw tran"
}
C {devices/code.sym} -590 250 0 0 {name=Temp_sweep only_toplevel=false 

value="

*Simulation
.control
dc temp -40 125 1
plot v(vout)
.endc

.end
"}
C {devices/lab_pin.sym} 390 210 0 0 {name=p1 sig_type=std_logic lab=vss}
C {/home/ac3e/Documents/ihp_design/xschem/LDO/ldo_v3.sym} -20 0 0 0 {name=x1}
C {devices/res.sym} 390 100 0 0 {name=Resr1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 460 100 0 0 {name=Cc1
m=1
value=50p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 460 210 0 0 {name=p3 sig_type=std_logic lab=vss}
