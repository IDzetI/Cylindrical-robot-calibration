L = 1.0;
lp = 0.1;

Tbase = eye(4);
Ttool = eye(4);

t = zeros(1,13);

k0 = 1e6; 

E = 6.9000e+10; 
G = 2.5500e+10; 
d = 0.15; 

S = pi*d^2/4; 
Iy = pi*d^4/64;
Iz = pi*d^4/64;
Ip = Iy + Iz;

K = [
    [E*S/L  0              0            0       0            0          ]
    [0      12*E*Iz/L^3   0            0       0            -6*E*Iz/L^2]
    [0      0              12*E*Iy/L^3 0       6*E*Iy/L^2 0          ]
    [0      0              0            G*Ip/L 0            0          ]
    [0      0              6*E*Iy/L^2 0       4*E*Iy/L  0          ]
    [0      -6*E*Iz/L^2    0            0       0            4*E*Iz/L  ]
    ];

Kt = [k0 zeros(1,12)
    zeros(6,1) K zeros(6,6)
    zeros(6,1) zeros(6,6) K];
    

platform_shift_x = [0.05 sqrt(0.1 ^ 2 - 0.05 ^ 2) 0];
platform_shift_y = [-0.1 0 0];
platform_shift_z = [0.05 -sqrt(0.1 ^ 2 - 0.05 ^ 2) 0];

Tbase_x = Ty(1.0)*Ry(pi/2)*Rz(pi);
Tbase_y = Tz(1.0)*Rx(-pi/2);
Tbase_z = eye(4);

deflection_map = zeros(10,10,10);

for xi = 0.001 : 0.1 : 1.0
    for yi = 0.001 : 0.1 : 1.0  
        for zi = 0.001 : 0.1 : 1.0  
            ee_pos = [xi yi zi];
            chain_x_pos = ee_pos + platform_shift_x;
            chain_y_pos = ee_pos + platform_shift_y;
            chain_z_pos = ee_pos + platform_shift_z;

            q_passive_x = find_q(Tbase_x, chain_x_pos, L, L);
            q_passive_y = find_q(Tbase_y, chain_y_pos, L, L);
            q_passive_z = find_q(Tbase_z, chain_z_pos, L, L);

            fk_x = Fk(Tbase_x, xi, q_passive_x, t, L);
            fk_y = Fk(Tbase_y, yi, q_passive_y, t, L);
            fk_z = Fk(Tbase_z, zi, q_passive_z, t, L);

            Jq_x = find_jq(fk_x, Tbase_x, xi, q_passive_x, t, L);
            Jq_y = find_jq(fk_y, Tbase_y, yi, q_passive_y, t, L);
            Jq_z = find_jq(fk_z, Tbase_z, zi, q_passive_z, t, L);

            Jt_x = find_jt(fk_x, Tbase_x, xi, q_passive_x, t, L);
            Jt_y = find_jt(fk_y, Tbase_y, yi, q_passive_y, t, L);
            Jt_z = find_jt(fk_z, Tbase_z, zi, q_passive_z, t, L);

            kc_x = find_kc(Kt, Jq_x, Jt_x);
            kc_y = find_kc(Kt, Jq_y, Jt_y);
            kc_z = find_kc(Kt, Jq_z, Jt_z);

            kc_total = kc_x + kc_y + kc_z;

            F=[0 0 100 0 0 0]';
            dt = inv(kc_total)*F;

            deflection = sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            deflection_map(uint8(xi*10)+1,uint8(yi*10)+1,uint8(zi*10)+1) = deflection; 
        end
    end
end

[X,Y,Z] = ndgrid(1:size(deflection_map,1), 1:size(deflection_map,2), 1:size(deflection_map,3));
pointsize = 1500;
scatter3(X(:)/10, Y(:)/10, Z(:)/10,pointsize, deflection_map(:),'.');
colorbar
caxis([0.0001, 0.0002])
title('Maximum deflections [0 0 100]')
xlabel('X')
ylabel('Y')
zlabel('Z')

saveas(gcf,'deflections_1.png')

