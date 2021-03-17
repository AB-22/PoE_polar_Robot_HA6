function Ad_T=Adjoint(T)
R=T(1:3,1:3);
p=T(1:3 ,4);

Ad_T=[R zeros(3); skew(p)*R R];
end
