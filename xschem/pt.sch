v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 10 -60 10 -30 {
lab=vdd}
N 10 30 10 60 {
lab=vout}
N 10 0 30 0 {
lab=vdd}
N 30 -60 30 0 {
lab=vdd}
N 10 -60 30 -60 {
lab=vdd}
N 10 -80 10 -60 {
lab=vdd}
N -50 0 -30 0 {
lab=vg}
C {sg13g2_pr/sg13_lv_pmos.sym} -10 0 0 0 {name=M1
L=0.5u
W=8000.0u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/iopin.sym} 10 -80 3 0 {name=p1 lab=vdd}
C {devices/iopin.sym} 10 60 1 0 {name=p2 lab=vout}
C {devices/iopin.sym} -50 0 2 0 {name=p3 lab=vg
}
C {devices/code_shown.sym} -420 -90 0 0 {name=spice only_toplevel=false value="

vdd vdd 0 1.8
vout vout 0 1.2
vg vg 0 1.23

.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi
tran 1n 10u
print @n.xm1.nsg13_lv_pmos[vgs]
.endc

"}
C {devices/code_shown.sym} -460 -340 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="

.param corner=0

.if (corner==0)
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.endif
"}
