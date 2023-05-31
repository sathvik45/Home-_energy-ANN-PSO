function NMSE_calc = NMSE( wb, net, input, target)
 net = setwb(net, wb');
 error = target - net(input);
 NMSE_calc =mean(error.^2)/mean(var(target',1));