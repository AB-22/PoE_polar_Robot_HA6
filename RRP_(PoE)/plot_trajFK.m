function [graphx, graphy, graphz , graphx_scatter ,graphy_scatter,graphz_scatter ]= plot_trajFK( q , L)
%FK_Classic= Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3))*Ty(L(4));
 

pos0=[0 , 0, 0]';
 T=Rz(q(1))*Tz(L(1));
 pos1=T(1:3,4);
 
  
 T=Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2));
 pos2=T(1:3,4);
 
 T=Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3));
 pos3=T(1:3,4);
 
 T=Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3));
 pos4=T(1:3,4);
 
  
 graphx=[pos0(1),pos1(1),pos2(1),pos3(1),pos4(1)];
 graphy=[pos0(2),pos1(2),pos2(2),pos3(2),pos4(2)];
 graphz=[pos0(3),pos1(3),pos2(3),pos3(3),pos4(3)];
 
 graphx_scatter=[pos0(1),pos1(1),pos3(1),pos4(1)];
 graphy_scatter=[pos0(2),pos1(2),pos3(2),pos4(2)];
 graphz_scatter=[pos0(3),pos1(3),pos3(3),pos4(3)];
end