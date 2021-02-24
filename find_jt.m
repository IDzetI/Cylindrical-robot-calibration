function [ Jt ] = find_jt(leg_fk, Tbase, q_a, q_p, t, L)
    leg_fk(1:3, 4) = [0; 0; 0];
    inv_fk = leg_fk.';

    T3d_2_7 = T3d(t(2), t(3), t(4), t(5), t(6), t(7));
    T3d_8_13 = T3d(t(8), t(9), t(10), t(11), t(12), t(13));

    dT = Tbase * Tz(q_a) * Tzd(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_1 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Txd(t(2))*Ty(t(3))*Tz(t(4))*Rx(t(5))*Ry(t(6))*Rz(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_2 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Tx(t(2))*Tyd(t(3))*Tz(t(4))*Rx(t(5))*Ry(t(6))*Rz(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_3 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Tx(t(2))*Ty(t(3))*Tzd(t(4))*Rx(t(5))*Ry(t(6))*Rz(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_4 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Tx(t(2))*Ty(t(3))*Tz(t(4))*Rxd(t(5))*Ry(t(6))*Rz(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_5 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Tx(t(2))*Ty(t(3))*Tz(t(4))*Rx(t(5))*Ryd(t(6))*Rz(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_6 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) ...
         * Tx(t(2))*Ty(t(3))*Tz(t(4))*Rx(t(5))*Ry(t(6))*Rzd(t(7)) ...
         * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_7 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Txd(t(8)) * Ty(t(9)) * Tz(t(10)) * Rx(t(11)) * Ry(t(12)) * Rz(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_8 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Tx(t(8)) * Tyd(t(9)) * Tz(t(10)) * Rx(t(11)) * Ry(t(12)) * Rz(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_9 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Tx(t(8)) * Ty(t(9)) * Tzd(t(10)) * Rx(t(11)) * Ry(t(12)) * Rz(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_10 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Tx(t(8)) * Ty(t(9)) * Tz(t(10)) * Rxd(t(11)) * Ry(t(12)) * Rz(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_11 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Tx(t(8)) * Ty(t(9)) * Tz(t(10)) * Rx(t(11)) * Ryd(t(12)) * Rz(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_12 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) ...
         * Tx(t(8)) * Ty(t(9)) * Tz(t(10)) * Rx(t(11)) * Ry(t(12)) * Rzd(t(13)) ...
         * Rz(q_p(3));
    dT = dT * inv_fk;

    Jt_13 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    Jt = [Jt_1 Jt_2 Jt_3 Jt_4 Jt_5 Jt_6 Jt_7 Jt_8 Jt_9 Jt_10 Jt_11 Jt_12 Jt_13];