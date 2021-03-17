function H= HT_rot_lin(S , theta)

Sw=S(1:3);
Sv=S(4:6);

H=[ Rodrigues_Formula_Rot(skew(Sw) , theta) , (eye(3)*theta + (1-cos(theta))*skew(Sw)+(theta-sin(theta))*(skew(Sw))^2)*Sv;
    zeros(1,3) , 1];
                                                


end