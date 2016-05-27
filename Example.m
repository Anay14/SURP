function [baseMVA, bus, gen, branch] = Example

baseMVA = 240e-6;

base_KV=.240;
rate_A=1500;

base_res = (base_KV)^2/baseMVA;

res_per_km  = 0.552; %ANT resistance in ohms
res_per_unit = res_per_km/base_res; %(p.u)(factor yet to be decide)

x_per_unit = 0.00281358/168.055; %(p.u)(inductive only)


% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
bus = [
1  3 0       0        0 0 1 1 0 .240 1 1.06 0.94;
2  1 746e-6  746e-6   0 0 1 1 0 .240 1 1.06 0.94;
3  1 746e-6  746e-6   0 0 1 1 0 .240 1 1.06 0.94;
];

% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
gen = [
1 0  0  .135 .048 1  240e-6 1 240e-6 .01;
];

% branch data
%fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
branch = [
1  2  res_per_unit*.06 8.95e-5 7.68e-5 150 0 0 0 0 1;
1  3   res_per_unit*.06 2.68e-4 2.30e-4 150 0 0 0 0 1;
];
return;

