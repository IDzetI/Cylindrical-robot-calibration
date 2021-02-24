function [ FinalT ] = Fk(Tbase, q_a, q_p, t, L)
    FinalT = Tbase * Tz(q_a) * Tz(t(1)) * Rz(q_p(1)) * Tx(L) * Rz(q_p(2)) * Tx(L) * Rz(q_p(3));