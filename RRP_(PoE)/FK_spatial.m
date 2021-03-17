function H= FK_spatial(M,S,q)
S1=S(:,1);
S2=S(:,2);
S3=S(:,3);
Sv3=S3(4:6);


T1=HT_rot_lin(S1 , q(1));
T2=HT_rot_lin(S2 , q(2));
T3=HT_lin(Sv3,q(3));

H=T1*T2*T3*M;



end