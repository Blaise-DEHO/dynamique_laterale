function Xdot =latdyn(X,U)
% u represente le vecteur d'entree
%x represente le vecteur d'etat
beta=X(1);
psidot=X(2);
ff=X(3);
fr=X(4);
delta=U;

% les constantes
vx=30;                   % vitesse longitidunale en  m/s
m=1500;                  %la masse du vehicule en    Kg
cyf=1*10^5;
cyr=1.5*10^5;
lf=1.3;
lr=1.7;
Iz=3000;                 %moment d'inertie en        Kg/m^2   
n=15;
sigma_af=1.2;
sigma_ar=0.3;

tau_f=sigma_af/vx;
tau_r=sigma_ar/vx;

%les equation
ay=(fr+ff*cos(delta))/m;
vydot=ay-vx*psidot;
psi2dot=(lf*ff-lr*fr)/Iz;
%betadot=vydot*vx/(vx^2+ vy^2);
betadot=vydot/(vx*(1+tan(beta)^2));
vy=tan(beta)*vx;
af=delta-atan((vy+lf*psidot)/vx);
ar=atan((lr*psidot-vy)/vx);
ffdot=(cyf*af-ff)/tau_f;
frdot=(cyr*ar-fr)/tau_r;

%les outputs

Xdot(1)=betadot;
Xdot(2)=psi2dot;
Xdot(3)=ffdot;
Xdot(4)=frdot;

end