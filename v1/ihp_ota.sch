v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 20 -20 40 {
lab=#net1}
N -20 -90 -20 -60 {
lab=#net2}
N 90 -90 190 -90 {
lab=#net2}
N 190 -90 190 -60 {
lab=#net2}
N 90 -110 90 -90 {
lab=#net2}
N -20 -90 90 -90 {
lab=#net2}
N -20 100 -20 140 {
lab=vss}
N 190 100 190 140 {
lab=vss}
N 500 50 500 140 {
lab=vss}
N 500 -50 500 -10 {
lab=vout}
N 480 -50 500 -50 {
lab=vout}
N 410 -50 420 -50 {
lab=#net3}
N 190 20 190 40 {
lab=#net4}
N 90 -200 90 -170 {
lab=vdd}
N 500 -200 500 -190 {
lab=vdd}
N -220 -80 -220 -30 {
lab=iref}
N -220 -80 -140 -80 {
lab=iref}
N -220 -110 -220 -80 {
lab=iref}
N -140 -140 -140 -80 {
lab=iref}
N -180 -140 -140 -140 {
lab=iref}
N -220 -200 -220 -170 {
lab=vdd}
N -220 -200 90 -200 {
lab=vdd}
N 60 70 150 70 {
lab=#net1}
N 110 -200 110 -140 {
lab=vdd}
N 90 -200 110 -200 {
lab=vdd}
N -240 -140 -220 -140 {
lab=vdd}
N -240 -200 -240 -140 {
lab=vdd}
N -240 -200 -220 -200 {
lab=vdd}
N -140 -140 50 -140 {
lab=iref}
N -20 140 190 140 {
lab=vss}
N 90 -140 110 -140 {
lab=vdd}
N -80 -30 -60 -30 {
lab=vin_n}
N 230 -30 250 -30 {
lab=vin_p}
N 500 -50 560 -50 {
lab=vout}
N 350 20 460 20 {
lab=#net4}
N 190 0 190 20 {
lab=#net4}
N 380 140 500 140 {
lab=vss}
N 110 -200 500 -200 {
lab=vdd}
N 400 -160 460 -160 {
lab=iref}
N 380 -50 380 140 {
lab=vss}
N 220 140 380 140 {
lab=vss}
N 350 -50 350 20 {
lab=#net4}
N 190 20 350 20 {
lab=#net4}
N 90 -30 190 -30 {
lab=#net2}
N 90 -90 90 -30 {
lab=#net2}
N -20 -30 90 -30 {
lab=#net2}
N 60 20 60 70 {
lab=#net1}
N 20 70 60 70 {
lab=#net1}
N -20 20 60 20 {
lab=#net1}
N -20 0 -20 20 {
lab=#net1}
N 500 -160 550 -160 {
lab=vdd}
N 550 -200 550 -160 {
lab=vdd}
N 500 -200 550 -200 {
lab=vdd}
N 500 20 530 20 {
lab=vss}
N 530 20 530 140 {
lab=vss}
N 500 140 530 140 {
lab=vss}
N 190 70 220 70 {
lab=vss}
N 220 70 220 140 {
lab=vss}
N 190 140 220 140 {
lab=vss}
N -40 70 -20 70 {
lab=vss}
N -40 70 -40 140 {
lab=vss}
N -40 140 -20 140 {
lab=vss}
N 500 -130 500 -120 {
lab=#net5}
N 500 -60 500 -50 {
lab=vout}
C {sg13g2_pr/sg13_lv_pmos.sym} 70 -140 0 0 {name=M2
L=\{l857\}
W=\{w5\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 0 70 2 0 {name=M4
L=\{l34\}
W=\{w34\}
ng=1
m=\{m34\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 480 20 2 1 {name=M6
L=\{l6\}
W=\{w6\}
ng=1
m=\{m6\}
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 480 -160 0 0 {name=M7
L=\{l857\}
W=\{w7\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/capa.sym} 450 -50 1 0 {name=C1
m=1
value=3.5p
footprint=1206
device="ceramic capacitor"}
C {sg13g2_pr/sg13_lv_pmos.sym} -200 -140 0 1 {name=M8
L=\{l857\}
W=\{w857\}
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/ipin.sym} -80 -30 0 0 {name=p1 lab=vin_n}
C {devices/ipin.sym} 250 -30 2 0 {name=p2 lab=vin_p}
C {devices/ipin.sym} -220 -30 3 0 {name=p3 lab=iref}
C {devices/iopin.sym} -240 -200 2 0 {name=p4 lab=vdd}
C {devices/iopin.sym} -20 140 2 0 {name=p5 lab=vss}
C {devices/opin.sym} 560 -50 0 0 {name=p6 lab=vout}
C {devices/lab_pin.sym} -30 -140 1 0 {name=p7 sig_type=std_logic lab=iref}
C {devices/lab_pin.sym} 400 -160 0 0 {name=p8 sig_type=std_logic lab=iref}
C {sg13g2_pr/sg13_lv_nmos.sym} 380 -70 3 1 {name=M9
L=0.45u
W=3u
ng=1
m=1
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/lab_pin.sym} -30 -200 1 0 {name=p9 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 380 -90 1 0 {name=p10 sig_type=std_logic lab=vdd}
C {sg13g2_pr/sg13_lv_pmos.sym} -40 -30 0 0 {name=M1
L=\{lpar\}
W=\{wpar\}
ng=1
m=\{mpar\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_pmos.sym} 210 -30 0 1 {name=M3
L=\{lpar\}
W=\{wpar\}
ng=1
m=\{mpar\}
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13g2_pr/sg13_lv_nmos.sym} 170 70 2 1 {name=M5
L=\{l34\}
W=\{w34\}
ng=1
m=\{m34\}
model=sg13_lv_nmos
spiceprefix=X
}
C {devices/ammeter.sym} 500 -90 0 0 {name=Vmeas savecurrent=true}
C {devices/ngspice_get_value.sym} 210 -70 0 0 {name=r16 node=@n.x1.xm3.nsg13_lv_pmos[gm]
descr="gm= "}
C {devices/launcher.sym} -220 90 0 0 {name=h1
descr=Annotate 
tclcommand="ngspice::annotate"}
