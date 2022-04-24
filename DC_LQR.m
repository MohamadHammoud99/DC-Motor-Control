% LQR Control

Q = [1 0 0    % optimal value of k
     0 1 0
     0 0 1];
 R = 1;
kk2 = lqr(A,B,Q,R)
[kk2 , P , E] =  lqr(A,B,Q,R)
