v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 270 150 380 150 {
lab=out}
N 270 130 270 150 {
lab=out}
N 270 50 270 70 {
lab=#net1}
N 270 -80 270 -10 {
lab=vd}
C {devices/code_shown.sym} -300 -20 0 0 {name=s1 only_toplevel=false 
value="
 
Vdd vd 0 1.2 ac 1

.control
pre_osdi /home/ac3e/Documents/psp103_nqs.osdi

tran 1e-6 1e-3
write test_tran.raw 
noise v(out) Vdd dec 333 10 100e3
print inoise_total onoise_total 
.endc


"}
C {devices/code_shown.sym} -320 -170 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
"}
C {devices/lab_pin.sym} 380 150 0 1 {name=p4 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 270 -80 2 1 {name=p2 sig_type=std_logic lab=vd}
C {sg13g2_pr/rhigh.sym} 270 100 0 0 {name=R4
W=0.5e-6
L=30e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 270 20 0 0 {name=R1
W=0.5e-6
L=10e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
