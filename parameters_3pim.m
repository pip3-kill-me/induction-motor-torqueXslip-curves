clear, clc, close all, format short 
r1 = 0.641;
x1 = 1.106i;
r2 = 0.332;
x2 = 0.464i;
xm = 26.3i;
v = 460;
et = 1; %star = 1; triangle = 0
np = 4;
w  = 0;
SoW = 0; % s = 0; w = 1
s = 0.016;
fe = 60;
pm = 100;

if et == 1
    vl = v/sqrt(3);
else
    vl = v;
end
ns = (120*fe)/np
if SoW == 1
    s = (ns-w)/ns
else
    w=ns*(1-s)
end
    
r2l = r2/s
req = ((r1+x1)+(((r2l+x2)*(xm))/((r2l+x2)+(xm))))
ie = vl/req
Ie = abs(ie)
anIe = rad2deg(angle(ie))
ir = ie*(xm/(xm+r2l+x2));
v1eq = vl*(xm/(r1+xm+x1))
V1eq = abs(v1eq)
anV1 = rad2deg(angle(v1eq))
z1eq = (xm*(r1+x1))/(r1+xm+x1)
r1eq = real(z1eq)
x1eq = imag(z1eq)
ws = ((2*pi)/60)*ns;
ip = abs(v1eq)/sqrt((real(z1eq)+r2)^2+(imag(z1eq))+x2)
tp = (3*r2*ip^2)/(((2*pi)/60)*ns);
smaxt = r2/(sqrt((r1eq)^2)+(x1eq+x2)^2);
smaxt = abs(smaxt)
nmaxt = ns*(1-smaxt)
tmax = abs((1/ws)*((1.5*v1eq^2)/(real(z1eq)+sqrt((real(z1eq))^2+(imag(z1eq)+x2)^2))))
pin = abs(3*vl*ie*cos(angle(ie)))
pscl = abs(3*r1*ie^2)
pag = pin-pscl
pconv = (1-s)*pag
pout = pconv-pm
n = pout/pin

x2=abs(x2)
a1 = 2*r2
rr = [0.01:0.02:a1]
sv = [0.01:0.01:1]
figure(1) 
subplot(1,1,1);
for k=1:1:length(sv)
    a1=(1/(((2*pi)/60)*w));
    a3=(3*(V1eq^2)*(r2/sv(k)));
    a4=((r1eq+(r2/sv(k)))^2);
    a5=((x1eq+x2)^2);;
    y(k) = a1*(a3/(a4+a5));
end
plot(sv, y)
r2=r2/2;
for k=1:1:length(sv)
    a1=(1/(((2*pi)/60)*w));
    a3=(3*(V1eq^2)*(r2/sv(k)));
    a4=((r1eq+(r2/sv(k)))^2);
    a5=((x1eq+x2)^2);;
    y(k) = a1*(a3/(a4+a5));
end
hold on
plot(sv, y)
r2=r2*4
for k=1:1:length(sv)
    a1=(1/(((2*pi)/60)*w));
    a3=(3*(V1eq^2)*(r2/sv(k)));
    a4=((r1eq+(r2/sv(k)))^2);
    a5=((x1eq+x2)^2);;
    y(k) = a1*(a3/(a4+a5));
end
hold on
plot(sv, y)
title('Curva de conjugado')
%xlabel('escorregamento (normalizado)') 
ylabel('Torque (N.m)')
legend({'R','R/2','R*2'},'Location','southwest')

%subplot(2,1,2);

