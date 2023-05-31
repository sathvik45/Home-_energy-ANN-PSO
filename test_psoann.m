testing=test3;
y=[testing.T_in(:) testing.T_wt(:) testing.P(:) time DR];
o1=netpso1(y')';
o2=netpso2(y')';
o3=netpso3(y')';
%o3=abs(o3);
out1=zeros(size(o1));
out2=zeros(size(o2));
out3=zeros(size(o3));
for i=1:1440
    if(o1(i)>1)
        out1(i)=1;
    end
    if(o2(i)>0.5)
        out2(i)=1;
    end
    if(o3(i)>0)
        out3(i)=1;
    end
end

t=1:1440;
actual_power=testing.P(:);
clear threepso_power;
for n=1:1440
    threepso_power(n)=testing.P_app(n)*out3(n)+testing.P_sh(n)*out1(n)+testing.P_hw(n)*out2(n);
end
figure;
plot(t,actual_power);
hold;
plot(t,threepso_power);