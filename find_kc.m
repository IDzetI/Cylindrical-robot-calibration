function [ kc ] = find_kc(Kt, Jq, Jt)
    kc0=inv(Jt*inv(Kt)*Jt');
    kc = kc0 - kc0*Jq*inv(Jq'*kc0*Jq)*Jq'*kc0;
