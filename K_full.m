function t = K_full(param)
   
   t = param.Kq(1);
   for i = 2:param.joint_no
       K = Ktheta(i,param);
       t = diagconcat2(t,K);
       t = diagconcat2(t,[param.Kq(i)]);
   end   
   K = Ktheta(param.joint_no+1, param);
   t = diagconcat2(t,K);  
      
end