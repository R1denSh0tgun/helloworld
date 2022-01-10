function [r] = FalsePosition(f,u,l,e) % function that is already defined,upper,lower,error
if f(u)*f(l)>0
    disp("wrong upper or lower boundary, try another")
    return
end
xnew = (l*f(u)-u*f(l))/(f(u)-f(l));
xold = xnew+1;
while abs(f(xnew))>0.001 & abs((xnew-xold)/xnew) > e
    
    if f(u)*f(xnew)<0 % real root between approximation and upper bound
        xold = xnew; %keep track of the previous approximation
        l = xnew; %update the lower bound as previous approximation
        xnew = (l*f(u)-u*f(l))/(f(u)-f(l));
    
    elseif f(l)*f(xnew)<0 %root between lower bound and approximation
        xold = xnew;
        u = xnew;
        xnew = (l*f(u)-u*f(l))/(f(u)-f(l));
    end
r = vpa(xnew)
end
return







