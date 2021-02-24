function [ Jq ] = find_jq(leg_fk, Tbase, q_a, q_p, t, L)
    leg_fk(1:3, 4) = [0; 0; 0];
    inv_fk = leg_fk.';

    T3d_2_7 = T3d(t(2), t(3), t(4), t(5), t(6), t(7));
    T3d_8_13 = T3d(t(8), t(9), t(10), t(11), t(12), t(13));

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rzd(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jq_1 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rzd(q_p(2)) * Tx(L) * T3d_8_13 * Rz(q_p(3));
    dT = dT * inv_fk;

    Jq_2 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    dT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * T3d_2_7 * Rz(q_p(2)) * Tx(L) * T3d_8_13 * Rzd(q_p(3));
    dT = dT * inv_fk;

    Jq_3 = [dT(1,4), dT(2,4), dT(3,4), dT(3,2) dT(1,3) dT(2,1)]'; 

    Jq = [Jq_1 Jq_2 Jq_3];

