%transfer function
Kp = 1;
Ki = 1;
Kd = 1;

s = tf('s');
C = Kp + Ki/s + Kd*s
%proportional constant
m = 1000;
b = 50;
r = 10;

s = tf('s');
P_cruise = 1/(m*s + b);

Kp = 100;
C = pid(Kp);

T = feedback(C*P_cruise,1)

t = 0:0.1:20;
figure(1);
step(r*T,t)
axis([0 20 0 10])
%we can increase the proportional gain
Kp = 5000;
C = pid(Kp);
T = feedback(C*P_cruise,1);
figure(2);
step(r*T,t)
axis([0 20 0 10])
% add integral controller to the system
Kp = 600;
Ki = 1;
C = pid(Kp,Ki);

T = feedback(C*P_cruise,1);
figure(3);
step(r*T,t)
axis([0 20 0 10])
% adjust the Kp & Ki
Kp = 800;
Ki = 40;
C = pid(Kp,Ki);

T = feedback(C*P_cruise,1);
figure(4);
step(r*T,t)
axis([0 20 0 10])
% Let Kp equal 1, Ki equal 1, and Kd equal 1
Kp = 1;
Ki = 1;
Kd = 1;
C = pid(Kp,Ki,Kd);

T = feedback(C*P_cruise,1);
figure(5);
step(r*T,t)