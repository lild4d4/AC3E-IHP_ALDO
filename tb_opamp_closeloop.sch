v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 600 -170 600 -130 { lab=GND}
N 600 -270 600 -230 { lab=vss}
N 700 -270 700 -230 { lab=vdd}
N 700 -170 700 -130 { lab=vss}
N 800 -360 800 -330 { lab=vin_signal}
N 1210 -190 1210 -150 { lab=vss}
N 1210 -280 1210 -250 { lab=#net1}
N 800 -270 800 -230 { lab=vsen}
N 800 -170 800 -130 { lab=vcm}
N 990 -550 1050 -550 { lab=vin}
N 980 -550 980 -360 { lab=vin}
N 980 -550 990 -550 { lab=vin}
N 800 -360 860 -360 { lab=vin_signal}
N 1030 -360 1090 -360 { lab=vin}
N 1260 -550 1310 -550 { lab=vout}
N 1030 -250 1030 -210 { lab=vss}
N 1030 -360 1030 -310 { lab=vin}
N 1390 -340 1390 -310 { lab=vout}
N 1310 -340 1390 -340 { lab=vout}
N 1390 -250 1390 -200 { lab=vss}
N 1110 -290 1110 -250 { lab=vcm}
N 1110 -190 1110 -150 { lab=vss}
N 1110 -320 1110 -290 { lab=vcm}
N 1110 -320 1170 -320 { lab=vcm}
N 1090 -360 1170 -360 { lab=vin}
N 920 -360 1030 -360 { lab=vin}
N 1310 -550 1390 -550 { lab=vout}
N 1390 -550 1390 -340 { lab=vout}
N 1050 -550 1200 -550 { lab=vin}
N 1230 -440 1230 -390 {
lab=vdd}
N 1250 -300 1250 -250 {
lab=vss}
C {vsource.sym} 600 -200 0 0 {name=V1 value=DC\{vss\}}
C {vsource.sym} 700 -200 0 0 {name=V2 value=DC\{vdd\}}
C {gnd.sym} 600 -130 0 0 {name=l14 lab=GND}
C {vsource.sym} 800 -200 0 0 {name=V4 value="sin(0 \{vac\} \{vac_fin\}) dc 0 ac 1"}
C {capa.sym} 800 -300 2 0 {name=C4
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 700 -270 1 0 {name=l15 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 600 -270 1 0 {name=l16 sig_type=std_logic lab=vss}
C {lab_pin.sym} 700 -130 3 0 {name=l18 sig_type=std_logic lab=vss}
C {lab_pin.sym} 800 -130 3 0 {name=l20 sig_type=std_logic lab=vcm}
C {isource.sym} 1210 -220 0 0 {name=I0 value=DC\{iref\}}
C {lab_pin.sym} 1210 -150 3 0 {name=l22 sig_type=std_logic lab=vss}
C {lab_wire.sym} 800 -250 3 0 {name=l24 sig_type=std_logic lab=vsen}
C {res.sym} 890 -360 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {res.sym} 1230 -550 1 0 {name=R3
value=5k
footprint=1206
device=resistor
m=1}
C {lab_pin.sym} 1030 -210 3 0 {name=l28 sig_type=std_logic lab=vss
}
C {capa.sym} 1030 -280 0 0 {name=C5
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {netlist_not_shown.sym} 650 -530 0 0 {name=SIMULATION only_toplevel=false 

value="


* Circuit Parameters
.param iref = 100u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.8
.param vac  = 60m
.param w857 = 1
.param l857 = 0.15
.param wpar = 1
.param lpar = 0.35
.param mpar = 1
.param w34  = 1
.param l34  = 0.15
.param m34  = 1
.param w6   = 1
.param l6   = 0.15
.param m6   = 1
.options TEMP = 125.0

* FFT Parameters
.param Ts_FFT     = 1e-9
.csparam Ts_FFT   = \{Ts_FFT\}
.param fin_approx = 1e6
.param NFFT       = 4096
.csparam NFFT     = \{NFFT\}
.param vac_fin    = 'floor(fin_approx*Ts_FFT*NFFT)/Ts_FFT/NFFT'
.csparam Ti_FFT   = 3u
.csparam vac_fin  = \{vac_fin\}

* Include Models
.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

* OP Parameters & Singals to save
.save all
+ @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[id] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[vth] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[vgs] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[vds] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[vdsat] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[gm] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[gds] @M.X1.XM1.msky130_fd_pr__pfet_01v8_lvt[cgg]
+ @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[id] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[vth] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[vgs] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[vds] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[vdsat] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[gm] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[gds] @M.X1.XM2.msky130_fd_pr__pfet_01v8_lvt[cgg]
+ @M.X1.XM3.msky130_fd_pr__nfet_01v8[id] @M.X1.XM3.msky130_fd_pr__nfet_01v8[vth] @M.X1.XM3.msky130_fd_pr__nfet_01v8[vgs] @M.X1.XM3.msky130_fd_pr__nfet_01v8[vds] @M.X1.XM3.msky130_fd_pr__nfet_01v8[vdsat] @M.X1.XM3.msky130_fd_pr__nfet_01v8[gm] @M.X1.XM3.msky130_fd_pr__nfet_01v8[gds] @M.X1.XM3.msky130_fd_pr__nfet_01v8[cgg]
+ @M.X1.XM4.msky130_fd_pr__nfet_01v8[id] @M.X1.XM4.msky130_fd_pr__nfet_01v8[vth] @M.X1.XM4.msky130_fd_pr__nfet_01v8[vgs] @M.X1.XM4.msky130_fd_pr__nfet_01v8[vds] @M.X1.XM4.msky130_fd_pr__nfet_01v8[vdsat] @M.X1.XM4.msky130_fd_pr__nfet_01v8[gm] @M.X1.XM4.msky130_fd_pr__nfet_01v8[gds] @M.X1.XM4.msky130_fd_pr__nfet_01v8[cgg]
+ @M.X1.XM5.msky130_fd_pr__pfet_01v8[id] @M.X1.XM5.msky130_fd_pr__pfet_01v8[vth] @M.X1.XM5.msky130_fd_pr__pfet_01v8[vgs] @M.X1.XM5.msky130_fd_pr__pfet_01v8[vds] @M.X1.XM5.msky130_fd_pr__pfet_01v8[vdsat] @M.X1.XM5.msky130_fd_pr__pfet_01v8[gm] @M.X1.XM5.msky130_fd_pr__pfet_01v8[gds] @M.X1.XM5.msky130_fd_pr__pfet_01v8[cgg]
+ @M.X1.XM6.msky130_fd_pr__nfet_01v8[id] @M.X1.XM6.msky130_fd_pr__nfet_01v8[vth] @M.X1.XM6.msky130_fd_pr__nfet_01v8[vgs] @M.X1.XM6.msky130_fd_pr__nfet_01v8[vds] @M.X1.XM6.msky130_fd_pr__nfet_01v8[vdsat] @M.X1.XM6.msky130_fd_pr__nfet_01v8[gm] @M.X1.XM6.msky130_fd_pr__nfet_01v8[gds] @M.X1.XM6.msky130_fd_pr__nfet_01v8[cgg]
+ @M.X1.XM7.msky130_fd_pr__pfet_01v8[id] @M.X1.XM7.msky130_fd_pr__pfet_01v8[vth] @M.X1.XM7.msky130_fd_pr__pfet_01v8[vgs] @M.X1.XM7.msky130_fd_pr__pfet_01v8[vds] @M.X1.XM7.msky130_fd_pr__pfet_01v8[vdsat] @M.X1.XM7.msky130_fd_pr__pfet_01v8[gm] @M.X1.XM7.msky130_fd_pr__pfet_01v8[gds] @M.X1.XM7.msky130_fd_pr__pfet_01v8[cgg]
+ @M.X1.XM8.msky130_fd_pr__pfet_01v8[id] @M.X1.XM8.msky130_fd_pr__pfet_01v8[vth] @M.X1.XM8.msky130_fd_pr__pfet_01v8[vgs] @M.X1.XM8.msky130_fd_pr__pfet_01v8[vds] @M.X1.XM8.msky130_fd_pr__pfet_01v8[vdsat] @M.X1.XM8.msky130_fd_pr__pfet_01v8[gm] @M.X1.XM8.msky130_fd_pr__pfet_01v8[gds] @M.X1.XM8.msky130_fd_pr__pfet_01v8[cgg]
+ @M.X1.XM9.msky130_fd_pr__nfet_01v8[id] @M.X1.XM9.msky130_fd_pr__nfet_01v8[vth] @M.X1.XM9.msky130_fd_pr__nfet_01v8[vgs] @M.X1.XM9.msky130_fd_pr__nfet_01v8[vds] @M.X1.XM9.msky130_fd_pr__nfet_01v8[vdsat] @M.X1.XM9.msky130_fd_pr__nfet_01v8[gm] @M.X1.XM9.msky130_fd_pr__nfet_01v8[gds] @M.X1.XM9.msky130_fd_pr__nfet_01v8[cgg]

*Simulation
.control
  set color0 = white

  ac dec 100 1k 10G
  setplot ac1
  meas ac GBW when vdb(vout)=0
  meas ac DCG find vdb(vout) at=1k
  plot vdb(vout) \{vp(vout)*180/PI\}
  
  reset
  tran 0.01u 11u
  setplot tran1
  plot v(vsen) v(vout)

  *reset    
  *set sqrnoise                          
  *noise v(vout) V4 dec 100 1k 10G 1
  *setplot noise1
  *plot onoise_spectrum
  *plot sqrt(integ(onoise_spectrum))      
  *let onoise_total_integrado = maximum(sqrt(integ(onoise_spectrum)))  
  *print onoise_total_integrado
  
  reset    
  noise v(vout) V4 dec 100 1k 10G 1
  setplot noise1
  plot onoise_spectrum
  setplot noise2
  print inoise_total
  print onoise_total
  print onoise_total.m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt.1overf
  print onoise_total.m.x1.xm1.msky130_fd_pr__pfet_01v8_lvt.id
  print onoise_total.m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt.1overf
  print onoise_total.m.x1.xm2.msky130_fd_pr__pfet_01v8_lvt.id
  print onoise_total.m.x1.xm3.msky130_fd_pr__nfet_01v8.1overf
  print onoise_total.m.x1.xm3.msky130_fd_pr__nfet_01v8.id
  print onoise_total.m.x1.xm4.msky130_fd_pr__nfet_01v8.1overf
  print onoise_total.m.x1.xm4.msky130_fd_pr__nfet_01v8.id
  print onoise_total.m.x1.xm5.msky130_fd_pr__pfet_01v8.1overf
  print onoise_total.m.x1.xm5.msky130_fd_pr__pfet_01v8.id
  print onoise_total.m.x1.xm6.msky130_fd_pr__nfet_01v8.1overf
  print onoise_total.m.x1.xm6.msky130_fd_pr__nfet_01v8.id
  print onoise_total.m.x1.xm7.msky130_fd_pr__pfet_01v8.1overf
  print onoise_total.m.x1.xm7.msky130_fd_pr__pfet_01v8.id
  vprint onoise_total.m.x1.xm8.msky130_fd_pr__pfet_01v8.1overf
  print onoise_total.m.x1.xm8.msky130_fd_pr__pfet_01v8.id
  set filetype=ascii
  write tpfinal_noise.raw

  reset
  tran 0.001u 11u
  fourier 9.765625e5 vout
  let THD_db = db(fourier11[1][3]/fourier11[1][1])
  print THD_db
  let lin-tstart = \{Ti_FFT\} $ skip the start - up phase
  let lin-tstep = \{Ts_FFT\}
  let lin-tstop = \{Ti_FFT + (NFFT-1) * Ts_FFT\} $ end earlier
  linearize vout
  set specwindow = none
  fft vout
  *plot mag(vout)
  plot db(mag(vout)) xlimit 0 20e6

  reset
  op
  setplot op1
  unset filetype
  write tb_opamp_closeloop.raw
  
.endc

.end
"}
C {capa.sym} 1390 -280 0 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {lab_pin.sym} 1390 -200 3 0 {name=l2 sig_type=std_logic lab=vss}
C {lab_wire.sym} 1360 -340 0 0 {name=l3 sig_type=std_logic lab=vout}
C {lab_pin.sym} 1110 -150 3 0 {name=l5 sig_type=std_logic lab=vss}
C {lab_wire.sym} 1150 -320 0 0 {name=l4 sig_type=std_logic lab=vcm}
C {vsource.sym} 1110 -220 0 0 {name=V5 value=DC\{vcm\}}
C {lab_wire.sym} 1110 -360 0 0 {name=l6 sig_type=std_logic lab=vin}
C {lab_wire.sym} 840 -360 0 0 {name=l7 sig_type=std_logic lab=vin_signal}
C {opamp.sym} 1230 -340 0 0 {name=x1}
C {lab_pin.sym} 1230 -430 2 0 {name=l1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 1250 -270 2 0 {name=l8 sig_type=std_logic lab=vss}
C {ngspice_probe.sym} 980 -420 0 0 {name=r5}
C {ngspice_probe.sym} 1130 -360 0 0 {name=r1}
C {ngspice_probe.sym} 1160 -320 2 0 {name=r2}
C {ngspice_probe.sym} 1210 -270 2 0 {name=r3}
C {ngspice_probe.sym} 1390 -350 0 0 {name=r4}
C {ngspice_probe.sym} 800 -350 2 0 {name=r6}
