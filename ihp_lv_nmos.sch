v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 -170 70 -150 {
lab=GND}
N 70 -240 70 -230 {
lab=Vgs}
N 330 -210 330 -150 {
lab=GND}
N 70 -350 70 -290 {
lab=GND}
N 70 -450 70 -410 {
lab=Vds}
N 330 -240 380 -240 {
lab=GND}
N 380 -240 380 -150 {
lab=GND}
N 70 -240 100 -240 {
lab=Vgs}
N 220 -240 290 -240 {
lab=Vgs}
N 70 -450 80 -450 {
lab=Vds}
N 330 -370 330 -350 {
lab=Vds}
N 330 -290 330 -270 {
lab=#net1}
C {devices/code_shown.sym} -550 -460 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/code_shown.sym} -540 -340 0 0 {name=NGSPICE only_toplevel=true 
value="
.savecurrents
.param temp=27
.control
* pre_osdi ./psp103_nqs.osdi
save all 

save @n.xm1.nsg13_lv_nmos[gm]
save @n.xm1.nsg13_lv_nmos[ids]

dc Vgs 1.5 0 -0.1

let gm = @n.xm1.nsg13_lv_nmos[gm]
let id = @n.xm1.nsg13_lv_nmos[ids]

let a = gm/id
setscale a

plot id
plot I(Vm1) id
*write mos_temp.raw
*wrdata mos_temp.csv I(Vm1) I(Vm2) I(Vm3) I(Vm4)
.endc

"}
C {devices/gnd.sym} 330 -150 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 70 -150 0 0 {name=l2 lab=GND}
C {devices/vsource.sym} 70 -200 0 0 {name=Vgs value=0.75}
C {devices/vsource.sym} 70 -380 0 0 {name=Vds value=1.5}
C {devices/gnd.sym} 70 -290 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 380 -150 0 0 {name=l4 lab=GND}
C {sg13g2_pr/sg13_lv_nmos.sym} 310 -240 2 1 {name=M1
L=0.35u
W=1.0u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} 100 -240 2 0 {name=p1 sig_type=std_logic lab=Vgs}
C {devices/lab_pin.sym} 220 -240 0 0 {name=p2 sig_type=std_logic lab=Vgs}
C {devices/lab_pin.sym} 80 -450 2 0 {name=p3 sig_type=std_logic lab=Vds}
C {devices/ammeter.sym} 330 -320 0 0 {name=Vm1}
C {devices/lab_pin.sym} 330 -370 2 0 {name=p4 sig_type=std_logic lab=Vds}
