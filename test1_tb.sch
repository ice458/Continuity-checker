v {xschem version=3.4.2 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -370 -230 -370 -190 {
lab=GND}
N -370 -300 -250 -300 {
lab=#net1}
N -250 -220 -250 -190 {
lab=GND}
N -370 -190 -370 -100 {
lab=GND}
N -250 -190 -250 -120 {
lab=GND}
N -370 -120 -250 -120 {
lab=GND}
N -290 -240 -250 -240 {
lab=#net2}
N -290 -240 -290 -200 {
lab=#net2}
N -290 -140 -290 -120 {
lab=GND}
N -260 -280 -250 -280 {
lab=out1}
N -260 -260 -250 -260 {
lab=out2}
N -370 -300 -370 -280 {
lab=#net1}
C {code_shown.sym} -710 -400 0 0 {name=NGSPICE
only_toplevel=true

value="
.include ~/.klayout/salt/ICPS2023_5/Technology/tech/models/SOI_CMOS
.control
save all

** simlation command
tran 5n 1m

** data plot
plot out1 out2
.endc
" }
C {vsin.sym} -370 -290 0 1 {name=V1 value=3}
C {gnd.sym} -370 -100 0 1 {name=l1 lab=GND}
C {test1.sym} -100 -260 0 1 {name=x1}
C {res.sym} -290 -170 0 1 {name=R1
value=100
footprint=1206
device=resistor
m=1}
C {opin.sym} -260 -280 0 1 {name=p1 lab=out1}
C {opin.sym} -260 -260 0 1 {name=p2 lab=out2}
