v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -10 -90 -10 -70 {
lab=vout}
N -10 -10 -10 10 {
lab=#net1}
N -10 10 100 10 {
lab=#net1}
N 100 -70 100 10 {
lab=#net1}
N 100 -70 130 -70 {
lab=#net1}
N 130 -10 130 10 {
lab=#net2}
N 130 10 270 10 {
lab=#net2}
N 270 -10 270 10 {
lab=#net2}
N 270 -70 410 -70 {
lab=#net3}
N 410 -10 410 30 {
lab=vout}
N -10 30 410 30 {
lab=vout}
N -10 30 -10 70 {
lab=vout}
N 130 70 270 70 {
lab=#net4}
N 270 130 410 130 {
lab=#net5}
N -10 130 130 130 {
lab=#net6}
N 690 70 830 70 {
lab=#net7}
N 830 130 970 130 {
lab=#net8}
N 550 130 690 130 {
lab=#net9}
N 1250 70 1390 70 {
lab=#net10}
N 1390 130 1530 130 {
lab=#net11}
N 1110 130 1250 130 {
lab=#net12}
N 410 70 550 70 {
lab=#net13}
N 970 70 1110 70 {
lab=#net14}
N 1530 70 1670 70 {
lab=vss}
N -10 170 -10 220 {
lab=vss}
N 1670 70 1670 170 {
lab=vss}
N -10 170 1670 170 {
lab=vss}
C {sg13g2_pr/rhigh.sym} -10 100 0 0 {name=R2
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} -10 -40 0 0 {name=R1
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {devices/iopin.sym} -10 -90 3 0 {name=p1 lab=vout}
C {devices/iopin.sym} -10 220 1 0 {name=p2 lab=vss}
C {sg13g2_pr/rhigh.sym} 130 -40 0 0 {name=R3
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 270 -40 0 0 {name=R4
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 410 -40 0 0 {name=R5
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 130 100 0 0 {name=R6
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 270 100 0 0 {name=R7
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 410 100 0 0 {name=R8
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 550 100 0 0 {name=R9
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 690 100 0 0 {name=R10
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 830 100 0 0 {name=R11
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 970 100 0 0 {name=R12
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 1110 100 0 0 {name=R13
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 1250 100 0 0 {name=R14
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 1390 100 0 0 {name=R15
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {sg13g2_pr/rhigh.sym} 1530 100 0 0 {name=R16
W=0.5e-6
L=2.5e-6
model=rhigh
spiceprefix=X
m=1
R=1360.0
Imax=0.3e-6
}
C {devices/iopin.sym} -10 30 2 0 {name=p3 lab=in_p
}
