function Rot= Rodrigues_Formula_Rot (w_hat , theta)

Rot = eye(3)+ sin(theta)*w_hat + (1-cos(theta))*w_hat^2;

end