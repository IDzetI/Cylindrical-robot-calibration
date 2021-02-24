function t = theta_jac(q, theta, param)
   
t = zeros(6,param.theta_no);
   
L1 = param.links(2,1); L3 = param.links(3,1); 
Ttool = param.tool; Tbase= eye(4);
 
drx = dRx(0); dry = dRy(0); drz = dRz(0);
dtx = dTx(0); dty = dTy(0); dtz = dTz(0);

%1
tmp = Tbase * Rz(q(1)) * drz * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,1) = Jcol(tmp);

%2
tmp = Tbase * Rz(q(1)) * Tz(L1) *dtx* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,2) = Jcol(tmp);

%3
tmp = Tbase * Rz(q(1)) * Tz(L1) *dty* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,3) = Jcol(tmp);

%4
tmp = Tbase * Rz(q(1)) * Tz(L1) *dtz* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,4) = Jcol(tmp);

%5
tmp = Tbase * Rz(q(1)) * Tz(L1) *drx* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,5) = Jcol(tmp);

%6
tmp = Tbase * Rz(q(1)) * Tz(L1) *dry* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,6) = Jcol(tmp);

%7
tmp = Tbase * Rz(q(1)) * Tz(L1) *drz* Tz(q(2)) * Ty(L3) * Ty(q(3)) * Ttool;
t(:,7) = Jcol(tmp);

%8
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) *dtz* Ty(L3) * Ty(q(3)) * Ttool;
t(:,8) = Jcol(tmp);

%9
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * dtx* Ty(q(3)) * Ttool;
t(:,9) = Jcol(tmp);

%10
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * dty* Ty(q(3)) * Ttool;
t(:,10) = Jcol(tmp);

%11
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * dtz* Ty(q(3)) * Ttool;
t(:,11) = Jcol(tmp);

%12
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * drx* Ty(q(3)) * Ttool;
t(:,12) = Jcol(tmp);

%13
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * dry* Ty(q(3)) * Ttool;
t(:,13) = Jcol(tmp);

%14
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * drz* Ty(q(3)) * Ttool;
t(:,14) = Jcol(tmp);

%15
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * dty * Ttool;
t(:,15) = Jcol(tmp);

%16
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * dtx * Ttool;
t(:,16) = Jcol(tmp);

%17
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * dty * Ttool;
t(:,17) = Jcol(tmp);

%18
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * dtz * Ttool;
t(:,18) = Jcol(tmp);

%19
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * drx * Ttool;
t(:,19) = Jcol(tmp);

%20
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * dry * Ttool;
t(:,20) = Jcol(tmp);

%21
tmp = Tbase * Rz(q(1)) * Tz(L1) * Tz(q(2)) * Ty(L3) * Ty(q(3)) * drz * Ttool;
t(:,21) = Jcol(tmp);

end