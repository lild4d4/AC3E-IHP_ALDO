v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 250 40 290 40 {
lab=vcm}
N 250 40 250 120 {
lab=vcm}
N 330 80 330 120 {
lab=#net1}
N 370 60 370 80 {
lab=vss}
N 350 -50 350 -30 {
lab=vdd}
N 430 20 480 20 {
lab=vout}
N 480 -90 480 20 {
lab=vout}
N 190 0 190 40 {
lab=vin}
N 190 0 290 0 {
lab=vin}
N -260 120 -260 150 {
lab=GND}
N -160 120 -160 150 {
lab=vss}
N -20 260 -20 290 {
lab=vcm}
N 250 180 250 210 {
lab=vss}
N 330 180 330 210 {
lab=vss}
N 190 100 190 130 {
lab=vss}
N -70 0 -55 0 {
lab=vcm}
N -20 110 -20 120 {
lab=vin}
N -20 180 -20 200 {
lab=vsen}
N 360 -90 480 -90 {
lab=vout}
N -160 20 -160 60 {
lab=vdd}
N -260 20 -260 60 {
lab=vss}
N 480 130 480 155 {
lab=vss}
N 480 20 480 70 {
lab=vout}
N 40 -90 300 -90 {
lab=#net2}
N 40 -90 40 -0 {
lab=#net2}
N 10 -0 40 -0 {
lab=#net2}
N 140 -0 190 -0 {
lab=vin}
N 40 0 90 -0 {
lab=#net2}
C {devices/vsource.sym} 250 150 0 0 {name=V1 value=DC\{vcm\} savecurrent=false}
C {devices/vsource.sym} -20 230 0 0 {name=V2 value="sin(0 \{vac\} \{vac_fin\}) dc 0 ac 1" savecurrent=false}
C {devices/vsource.sym} -160 90 0 0 {name=V4 value=DC\{vdd\} savecurrent=false}
C {devices/vsource.sym} -260 90 0 0 {name=V5 value=DC\{vss\} savecurrent=false}
C {devices/isource.sym} 330 150 0 0 {name=I0 value=DC\{iref\}}
C {devices/capa.sym} 190 70 0 0 {name=C1
m=1
value=3p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} -20 290 0 0 {name=p1 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 250 210 0 0 {name=p2 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 190 130 0 0 {name=p3 sig_type=std_logic lab=vss}
C {devices/gnd.sym} -260 150 0 0 {name=l1 lab=GND}
C {devices/res.sym} -25 0 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} -20 150 0 0 {name=C2
m=1
value=1
footprint=1206
device="ceramic capacitor"}
C {devices/res.sym} 330 -90 1 0 {name=R2
value=5k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -260 20 0 0 {name=p5 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} -160 20 0 0 {name=p6 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 350 -50 0 0 {name=p7 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} 270 40 0 0 {name=p8 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} 370 80 2 0 {name=p9 sig_type=std_logic lab=vss}
C {devices/capa.sym} 480 100 0 0 {name=C3
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 480 155 0 0 {name=p10 sig_type=std_logic lab=vss}
C {devices/code.sym} -280 -230 0 0 {name=SIMULATION only_toplevel=false 

value="


* Circuit Parameters
.param iref = 100u
.param vdd  = 1.8
.param vss  = 0.0
.param vcm  = 0.9
.param vac  = 60m
.param w857 = 5u
.param l857 = 0.5u
.param wpar = 400u
.param lpar = 0.5u
.param mpar = 1
.param w34  = 100u
.param l34  = 0.5u
.param m34  = 1
.param w6   = 300u
.param l6   = 0.5u
.param m6   = 1
.param w7   = w857*27.6
.param w5   = 5u
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
*.lib ~/skywater/skywater-pdk/libraries/sky130_fd_pr_ngspice/latest/models/corners/sky130.lib TT

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
+ @n.x1.XM7.nsg13_lv_pmos[ids]
+ @n.x1.XM7.nsg13_lv_pmos[vds]
+ @n.x1.xm8.nsg13_lv_pmos[vds]
+ @n.x1.xm6.nsg13_lv_nmos[gm]
+ @n.x1.xm6.nsg13_lv_nmos[vds]
+ @n.x1.xm6.nsg13_lv_nmos[vgs]
+ @n.x1.xm2.nsg13_lv_pmos[vds]
+ @n.x1.xm2.nsg13_lv_pmos[vgs]
+ @n.x1.xm1.nsg13_lv_pmos[vds]
+ @n.x1.xm3.nsg13_lv_pmos[vds]

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
  op
  print @n.x1.XM7.nsg13_lv_pmos[ids]
  print @n.x1.xm8.nsg13_lv_pmos[vds]
  print @n.x1.xm6.nsg13_lv_nmos[gm]
  print @n.x1.xm6.nsg13_lv_nmos[vds]
  print @n.x1.xm6.nsg13_lv_nmos[vgs]
  print @n.x1.XM7.nsg13_lv_pmos[vds]
  print @n.x1.xm2.nsg13_lv_pmos[vds]
  print @n.x1.xm2.nsg13_lv_pmos[vgs]
  print @n.x1.xm1.nsg13_lv_pmos[vds]
  print @n.x1.xm3.nsg13_lv_pmos[vds]
  print I(v.x1.vmeas)
  

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
C {devices/code_shown.sym} -390 -380 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerMOSlv.lib mos_tt
*.lib $::SG13G2_MODELS/cornerMOShv.lib mos_tt
"}
C {devices/lab_pin.sym} -20 190 0 0 {name=p11 sig_type=std_logic lab=vsen}
C {devices/lab_pin.sym} 260 0 0 0 {name=p13 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 330 210 0 0 {name=p14 sig_type=std_logic lab=vss}
C {devices/lab_pin.sym} 480 20 2 0 {name=p15 sig_type=std_logic lab=vout}
C {/foss/designs/ihp_design/ihp_ota.sym} 350 20 0 0 {name=x1}
C {devices/lab_pin.sym} -160 150 0 0 {name=p4 sig_type=std_logic lab=vss}
C {devices/res.sym} 115 0 1 0 {name=R3
value=1G
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} -70 0 0 0 {name=p12 sig_type=std_logic lab=vcm}
C {devices/lab_pin.sym} -20 110 0 0 {name=p16 sig_type=std_logic lab=vin}
