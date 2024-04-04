v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Off-Chip resistanace} 610 40 3 0 0.4 0.4 {}
N 350 120 350 150 {
lab=GND}
N 350 20 350 60 {
lab=vss}
N 600 -190 690 -190 {
lab=vout}
N 690 -190 690 -160 {
lab=vout}
N 690 -100 690 -60 {
lab=#net1}
N 690 0 690 20 {
lab=vss}
N 230 -210 250 -210 {
lab=#net2}
N 150 -210 170 -210 {
lab=vdd}
N 150 -190 250 -190 {
lab=iref}
N 150 -170 250 -170 {
lab=vcm}
N 380 -130 380 -100 {
lab=vss}
N 500 -190 540 -190 {
lab=#net3}
N 780 -190 780 -120 {
lab=vout}
N 690 -190 780 -190 {
lab=vout}
N 780 -60 780 20 {
lab=vss}
C {devices/vsource.sym} 350 90 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/gnd.sym} 350 150 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} 350 20 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 380 -100 3 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} -1060 -170 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif
"}
C {devices/lab_pin.sym} 150 -170 0 0 {name=p13 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 780 -190 2 0 {name=p15 sig_type=std_logic lab=vout}
C {devices/code.sym} -600 -260 0 0 {name=Simulation_parameters only_toplevel=true

value="

Vs vdd 0 1.8 AC 1
Vref vcm 0 0.9
Iin iref 0 5e-6

.param temp=27
.save all

"}
C {devices/lab_pin.sym} 150 -190 0 0 {name=p17 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 150 -210 0 0 {name=p19 sig_type=std_logic lab=vdd}
C {devices/ammeter.sym} 570 -190 3 0 {name=Vmeas savecurrent=true}
C {devices/ammeter.sym} 200 -210 3 0 {name=Vmeas1 savecurrent=true}
C {devices/code.sym} -400 -260 0 0 {name=Load_parameters only_toplevel=false 

value="

.param R=18
*R10 vout 0 \{R\}
IL vout 0 PWL(0 0.1m 10u 0.1m 20u 10m 30u 10m)
*CL vout 0 50p

"}
C {devices/code.sym} -200 -260 0 0 {name=OTA_parameters only_toplevel=false 

value="

.param vdd  = 1.8
.param vss  = 0.0
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
C {devices/capa.sym} 690 -30 0 0 {name=CL
m=1
value=10u
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 690 -130 0 0 {name=Resr
value=2
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 690 20 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/title.sym} -400 370 0 0 {name=l2 author="Daniel Arevalos"}
C {/home/ac3e/Documents/ihp_design/v3/ldo_v3.sym} 370 -190 0 0 {name=x2}
C {devices/res.sym} 780 -90 0 0 {name=Resr1
value=\{R\}
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 780 20 0 0 {name=p1 sig_type=std_logic lab=vss}
C {devices/code_shown.sym} 920 -380 0 0 {name=NGSPICE only_toplevel=true 
value="
.param mm_ok=1
.param mc_ok=1
.param temp=27

.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi

define gauss ( nom , var , sig ) ( nom + nom * var / sig * sgauss (0))

let mc_runs = 10
let run = 0
set curplot=new
set scratch=$curplot
setplot $scratch
let vout=unitvec(mc_runs)
let vdd=unitvec(mc_runs)
let vcm=unitvec(mc_runs)
let iref=unitvec(mc_runs)

***************** LOOP *********************
dowhile run < mc_runs
alter vs = gauss (1.8 , 0.2 , 3)
alter vref = gauss (0.9 , 0.01 , 3)
alter iin = gauss (5e-6 , 0.1e-6 , 3)
*dc Vds 0 3 0.01
op
set run=$&run
set dt=$curplot
setplot $scratch
let out\{$run\}=\{$dt\}.v(vout)
let Vout[run]=\{$dt\}.v(vout)
let Vdd[run]=\{$dt\}.v(vdd)
let Vcm[run]=\{$dt\}.v(vcm)
let Iref[run]=\{$dt\}.i(Iref)
setplot $dt
reset
let run=run+1 
end
***************** LOOP *********************

plot \{$scratch\}.all 

wrdata /home/ac3e/Documents/ihp_design/v3/mc_ldo_closeloop.csv \{$scratch\}.vout \{$scratch\}.vdd \{$scratch\}.vcm \{$scratch\}.iref
write /home/ac3e/Documents/ihp_design/v3/mc_ldo_closeloop.raw
echo
print \{$scratch\}.vout \{$scratch\}.vdd \{$scratch\}.vcm \{$scratch\}.iref

.endc
"}
