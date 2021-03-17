function J= Jacob_spatial(S,q)
S1=S(:,1);
S2=S(:,2);
S3=S(:,3);


J1=S1;
T1=HT_rot_lin(S1 , q(1));
J2=(Adjoint(T1))*S2;

T2=T1*HT_rot_lin(S2 , q(2));
J3=(Adjoint(T2))*S3;

J=[J1 J2 J3];

end