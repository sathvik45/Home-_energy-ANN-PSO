testing=test3;
y=[testing.T_in(:) testing.T_wt(:) testing.P(:) time DR];
newy=net0(transpose(y));
newy=transpose(newy);
sz=size(newy);
res=zeros(sz);
for z=1:1440
    for x=1:3
        if(newy(z,x)>0.5)
            res(z,x)=1;
        else
            res(z,x)=0;
        end
    end
end

t=1:1440;
actual_power=testing.P(:);
clear reduced_power;
for n=1:1440
    reduced_power(n)=testing.P_app(n)*res(n,3)+testing.P_sh(n)*res(n,1)+testing.P_hw(n)*res(n,2);
end
%%reduced_power=data.P_app(:,1)*transpose(app(:,1))+data.P_sh(:,1)*transpose(ac(:,1))+data.P_hw(:,1)*transpose(wh(:,1));
figure;
plot(t,actual_power);
hold;
plot(t,reduced_power);