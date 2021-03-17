function J = Jacobian(q,L)

H=Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3));
R = H(1:3,1:3);

%1st column of Jacobian
J1p=Rzd(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3));

J1r=J1p*[R^-1 zeros(3,1);0 0 0 1];
J1=Jcol(J1r);


%2nd column of Jacobian
J2p=Rz(q(1))*Tz(L(1))*Rxd(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3));

J2r=J2p*[R^-1 zeros(3,1);0 0 0 1];
J2=Jcol(J2r);


%3rd column of Jacobian
J3p=Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Tyd(q(3));

J3r=J3p*[R^-1 zeros(3,1);0 0 0 1];
J3=Jcol(J3r);



% Calculate the full Jacobian
J=[J1,J2,J3];
end


