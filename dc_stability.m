%%Stability analysis
%transfer function 
num = 1;
den= [3.5512e-04 1.2914e-5 1.4031e-05 0];
%den1 = [1 1.4546*10^6 1.4545*10^8 0];
motor_tf = tf(num,den)

rlocus(motor_tf);
bode(motor_tf)
nyquist(motor_tf)



