% values of parameters 

J = 3.2284E-6; % Rotor  moment of Inertia (N.m/(rad/s2))
b = 3.5077E-6; % Damping Ratio (N.m/(rad/s))
K = 0.0274;    % Motor Torque constant(N.m/A)
R = 4;         % Elctrical Resistance (ohm)
L = 2.75E-6;   % Elicrtical Inductance  (H)


A = [0 1 0;0 -b/J K/J;0 -K/L -R/L]; % sate matrix 
B = [0 ; 0 ; 1/L];                  
C = [1  1  0];   % we want to control x1 which  is theta  
D = 0;
motor_sys = ss(A,B,C,D); %state space representation 
 
eig(A)   %

%controllability
con = ctrb(motor_sys);
det(con);
if (det(con)~=0)  % rank == 3
    fprintf("The System is Controllabe");
else 
    fprintf("The System is not fully Controllabe");
end
  

fprintf("\n")


%Observability
obs = obsv(motor_sys); 
det(obs);
if (det(obs)~=0) % rank == 3
    fprintf("The System is Observable");
else 
    fprintf("The System is not fully Observable");
end


%desired poles   for overshooting <= 20% and rise time = 0.5 sec using 
%ackerman method
 p1 = -15 ;
 p2 = -2.052-4.072i ;
 p3 = -2.052+4.072i ;
 K1 = acker(A,B,[p1 p2 p3]); % gian matrix of the state feedback controller
                
 