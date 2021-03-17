clc
clear all
close all
%% Link Lengths of RRP Robot
L=[0.75 0.4 0.75];


%% Zero Position Matrix of Robot

M=[1 0 0 0; 0 1 0 L(3); 0 0 1 L(1)+L(2); 0 0 0 1];

%% Skrew vectors Matrix
Sw1=[0 0 1]';
Sv1=[0 0 0]';
S1=[Sw1;Sv1];

Sw2=[1 0 0]';
Sv2=[0 L(1) 0]';
S2=[Sw2;Sv2];

Sw3=[0 0 0]';
Sv3=[0 1 0]';
S3=[Sw3;Sv3];

S=[S1 S2 S3];

%% FK of RRP Robot
q=[pi/6 pi/7 1];

H= FK_spatial(M,S,q);

FK_Classic= Rz(q(1))*Tz(L(1))*Rx(q(2))*Tz(L(2))*Ty(L(3))*Ty(q(3));

Err=FK_Classic-H

%% Jacobian of RRP Robot
Jacob=Jacob_spatial(S,q);
Jacob_class=Jacobian(q,L);
Err_Jac=Jacob-Jacob_class

%% Visualization of Robot
clf
q=[-pi/2 -pi/6 1];
[graphx, graphy, graphz,graphx_scatter ,graphy_scatter,graphz_scatter ]= plot_trajFK( q , L);
figure(1)
plot3(graphx(1:4), graphy(1:4), graphz(1:4), 'b', 'LineWidth',3)
hold on
plot3(graphx(4:5), graphy(4:5), graphz(4:5), 'k', 'LineWidth',1)
xlim([-3 3])
ylim([-3 3])
zlim([0 3])
xlabel('x')
ylabel('y')
zlabel('z')
grid on
hold on
scatter3(graphx_scatter(1:3) ,graphy_scatter(1:3),graphz_scatter(1:3), 'r' , 'filled','LineWidth',1.2)
hold on
end_effector=[graphx(5),graphy(5),graphz(5)];
plot3(end_effector(1),end_effector(2) , end_effector(3),'-o', 'LineWidth',2 ,'Color','green')
hold on

%% Simple Motion for Robot
Q=[0 0 0; pi/24 0 0; pi/12 0 0; pi/6 0 0; pi/2 0 0; pi/2 pi/12 0;
    pi/2 pi/6 0;pi/2 pi/3 0;pi/2 pi/3 1];
figure(2)
simple_motion_plot( Q , L)
