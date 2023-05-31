f_ac=ac(:,1);
f_wh=wh(:,1);
f_app=app(:,1);
f_T_ac=data.T_in(:,1);
f_T_wh=data.T_wt(:,1);
f_pow=data.P(:,1);
for i=2:100
    f_ac=[f_ac;ac(:,i)];
    f_wh=[f_wh;wh(:,i)];
    f_app=[f_app;app(:,i)];
    f_T_ac=[f_T_ac;data.T_in(:,i)];
    f_T_wh=[f_T_wh;data.T_wt(:,i)];
    f_pow=[f_pow;data.P(:,i)];
end
f_time=repmat(time,100,1);
f_DR=repmat(DR,100,1);
input0=[f_T_ac f_T_wh f_pow f_time f_DR ]';
target0=[f_ac f_wh f_app ]';
net0=feedforwardnet(12);
net0=train(net0,input0,target0);

% n=5;
% netadd=feedforwardnet(5);
% netadd = configure(netadd,I,T);
% h = @(x) NMSE(x, netadd,I, T);
% [x, err_ga] = pso(h, 2*n+2*n+n+2)
% netadd = setwb(netadd, x');
