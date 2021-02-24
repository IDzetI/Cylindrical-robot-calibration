function q = find_q(Tbase, chain_pos, l1, l2)
    r_base = Tbase(1:3, 1:3);
    t_base = Tbase(1:3, 4);
    pos = transpose(r_base) * (chain_pos'-t_base);
    x = pos(1);
    y = pos(2);
    z = pos(3);

    cosq2 = (x^2 + y^2 - l1^2 - l2^2) / (2*l1*l2);
    sinq2 = sqrt(1 - cosq2^2);
    q2 = atan2(sinq2,cosq2);
    q1 = atan2(y,x) - atan2(l2*sinq2, l1+l2*cosq2);
    q3 = -q1 -q2;
    q = [q1,q2,q3];
end

