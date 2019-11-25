%==================    Crisp input  =======================
  %input theta
  %input w
clc,clear;
format long;

%=== ===== ==========  Membership data    ==================
% theta 
n=0.025/0.2;
theta_nb=n*[-1000 -15 -10];
theta_nm=n*[-10 -5 -1];
theta_ns=n*[-0.2 -0.1 0];
theta_zo=n*[-0.1 0 0.1];
theta_ps=n*[0 0.1 0.2 ];
theta_pm=n*[1 5 10];
theta_pb=n*[10 15 1000];
%   w   
m=0.025/0.2;
w_nb=m*[-90 -30 -20];
w_nm=m*[-30 -20 -10];
w_ns=m*[-0.2 -0.1 0];
w_zo=m*[-0.1 0 0.1];
w_ps=m*[0 0.1 0.2];
w_pm=m*[10 20 30];
w_pb=m*[20 30 90];
%  u  
p=20;
u_nb=-9*p;
u_nm=-8*p;
u_ns=-6*p;
u_zo=0;
u_ps=6*p;
u_pm=8*p;
u_pb=9*p;

xd=0;
ts=0.01;
time=20;
M=1;m=0.1;L=0.5;g=9.8;
%init value  X=¨¤«×  Y=¨¤³t«×    
u(1)=0;
X(1)=0.1;
Y(1)=0;
i=1;
%sin(2*pi*i/10)
for t=1:ts:time
    f1=(g*sin(X(i))-cos(X(i))*(m*L/(M+m)* Y(i)^2 * sin(X(i))))/(4/3*L-m*L/(M+m)*cos(X(i))^2);
    b1=(1/(M+m)*cos(X(i)))/(4/3*L-m*L/(M+m)*cos(X(i))^2);
    Y(i+1)=Y(i)+(f1+b1*u(i))*ts;
    X(i+1)=X(i)+Y(i+1)*ts;
    if i==1
        x=X(1)-xd;
        y=Y(1);
    end
    if i>=2
        x=X(i+1)-xd ;  %theta error
        y=((X(i+1)-X(i)) - (X(i)-X(i-1) ) )/ts ;%w error
    end
    if i==500
        X(i+1)=-0.1;
end


%==============    Fuzzy  Rule  (49)  & Fuzzy Inferrence  ===============
[a(1),b(1)]=rule(x,y,theta_nb,w_nb,u_nb,1,1);
[a(2),b(2)]=rule(x,y,theta_nb,w_nm,u_nb,1,0);
[a(3),b(3)]=rule(x,y,theta_nb,w_ns,u_nb,1,0);
[a(4),b(4)]=rule(x,y,theta_nb,w_zo,u_nb,1,0);
[a(5),b(5)]=rule(x,y,theta_nb,w_ps,u_nm,1,0);
[a(6),b(6)]=rule(x,y,theta_nb,w_pm,u_nm,1,0);
[a(7),b(7)]=rule(x,y,theta_nb,w_pb,u_ns,1,1);

[a(8),b(8)]=rule(x,y,theta_nm,w_nb,u_nb,0,1);
[a(9),b(9)]=rule(x,y,theta_nm,w_nm,u_nb,0,0);
[a(10),b(10)]=rule(x,y,theta_nm,w_ns,u_nm,0,0);
[a(11),b(11)]=rule(x,y,theta_nm,w_zo,u_nm,0,0);
[a(12),b(12)]=rule(x,y,theta_nm,w_ps,u_ns,0,0);
[a(13),b(13)]=rule(x,y,theta_nm,w_pm,u_zo,0,0);
[a(14),b(14)]=rule(x,y,theta_nm,w_pb,u_zo,0,1);

[a(15),b(15)]=rule(x,y,theta_ns,w_nb,u_nb,0,1);
[a(16),b(16)]=rule(x,y,theta_ns,w_nm,u_nm,0,0);
[a(1),b(1)]=rule(x,y,theta_ns,w_ns,u_ns,1,1);
[a(2),b(2)]=rule(x,y,theta_ns,w_zo,u_ns,1,0);
[a(3),b(3)]=rule(x,y,theta_ns,w_ps,u_zo,1,1);
[a(20),b(20)]=rule(x,y,theta_ns,w_pm,u_ps,0,0);
[a(21),b(21)]=rule(x,y,theta_ns,w_pb,u_pm,0,1);

[a(22),b(22)]=rule(x,y,theta_zo,w_nb,u_nb,0,1);
[a(23),b(23)]=rule(x,y,theta_zo,w_nm,u_nm,0,0);
[a(4),b(4)]=rule(x,y,theta_zo,w_ns,u_ns,0,1);
[a(5),b(5)]=rule(x,y,theta_zo,w_zo,u_zo,0,0);
[a(6),b(6)]=rule(x,y,theta_zo,w_ps,u_ps,0,1);
[a(27),b(27)]=rule(x,y,theta_zo,w_pm,u_pm,0,0);
[a(28),b(28)]=rule(x,y,theta_zo,w_pb,u_pb,0,1);

[a(29),b(29)]=rule(x,y,theta_ps,w_nb,u_nm,0,1);
[a(30),b(30)]=rule(x,y,theta_ps,w_nm,u_ns,0,0);
[a(7),b(7)]=rule(x,y,theta_ps,w_ns,u_zo,1,1);
[a(8),b(8)]=rule(x,y,theta_ps,w_zo,u_ps,1,0);
[a(9),b(9)]=rule(x,y,theta_ps,w_ps,u_ps,1,1);
[a(34),b(34)]=rule(x,y,theta_ps,w_pm,u_pm,0,0);
[a(35),b(35)]=rule(x,y,theta_ps,w_pb,u_pb,0,1);

[a(36),b(36)]=rule(x,y,theta_pm,w_nb,u_zo,0,1);
[a(37),b(37)]=rule(x,y,theta_pm,w_nm,u_zo,0,0);
[a(38),b(38)]=rule(x,y,theta_pm,w_ns,u_ps,0,0);
[a(39),b(39)]=rule(x,y,theta_pm,w_zo,u_pm,0,0);
[a(40),b(40)]=rule(x,y,theta_pm,w_ps,u_pm,0,0);
[a(41),b(41)]=rule(x,y,theta_pm,w_pm,u_pb,0,0);
[a(42),b(42)]=rule(x,y,theta_pm,w_pb,u_pb,0,1);
 
[a(43),b(43)]=rule(x,y,theta_pb,w_nb,u_ps,1,1);
[a(44),b(44)]=rule(x,y,theta_pb,w_nm,u_pm,0,0);
[a(45),b(45)]=rule(x,y,theta_pb,w_ns,u_pm,0,0);
[a(46),b(46)]=rule(x,y,theta_pb,w_zo,u_pb,0,0);
[a(47),b(47)]=rule(x,y,theta_pb,w_ps,u_pb,0,0);
[a(48),b(48)]=rule(x,y,theta_pb,w_pm,u_pb,0,0);
[a(49),b(49)]=rule(x,y,theta_pb,w_pb,u_pb,1,1);

%================  Defuzzier  ========================
u(i+1)=-1*defuzzier( a,b );
i=i+1;
end

figure(1)
plot(1:i,X(:));
