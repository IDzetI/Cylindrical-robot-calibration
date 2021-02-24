%% robot parameters

% material
robot.E = 7e10;
robot.nu = 0.346;
robot.ro = 2699;

robot.links = [0 .35 0.30 5;         % link 1
               0.4 0.35 0.30 5;       % link 2
               0.1 0.25 0.20 5;       % link 3
               0.1 0.35 0.30 5;       % link 4
               ];      

           
robot.Kq = 1e6 *[1 2 0.5];
robot.use_links = true;
robot.use_gravity = false;

% joints
robot.joint_no = 3;
robot.theta_no = 6*(robot.joint_no)+robot.joint_no;

% tool
robot.tool = eye(4);

% base
robot.base = eye(4);

% mass recalculation
for i = 1:size(robot.links, 1)
    robot.links(i,4) = (pi/4)*(robot.links(i,2)^2-robot.links(i,3)^2)*robot.links(i,1)*robot.ro;
end

robot.limits = [deg2rad([-170, 170]); 0, 0.5;0 ,0.5];
         
robot.orientation = false;

