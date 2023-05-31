n=12;
netpso1=feedforwardnet(12);
netpso1=configure(netpso1,input0,target0(1,:));
h1 = @(x1) NMSE(x1, netpso1,input0,target0(1,:));
[x1, err_ga1] = pso(h1, 5*n+n+n+1)
netadd1 = setwb(netpso1, x1');


netpso2=feedforwardnet(12);
netpso2=configure(netpso2,input0,target0(2,:));
h2 = @(x2) NMSE(x2, netpso2,input0,target0(2,:));
[x2, err_ga2] = pso(h2, 5*n+n+n+1)
netadd2 = setwb(netpso2, x2');


netpso3=feedforwardnet(12);
netpso3=configure(netpso3,input0,target0(3,:));
h3 = @(x3) NMSE(x3, netpso3,input0,target0(3,:));
[x3, err_ga3] = pso(h3, 5*n+n+n+1)
netadd3 = setwb(netpso3, x3');
