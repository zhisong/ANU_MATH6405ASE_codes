function [startp] = estimate_start_point(plist, rlist, rtarget)

  % we find the interval where target sits
  
  for i = 1:numel(plist)-1
      if ((rlist(i)-rtarget)*(rlist(i+1)-rtarget)) <= 0 % if rtarget sits within the interval
          break
      end
  end
  
  % interpolate between
  if (rlist(i) == rtarget)
      startp = plist(i);
  elseif (rlist(i)<rlist(i+1))
    startp = interp1([rlist(i) rlist(i+1)], [plist(i) plist(i+1)], rtarget, 'linear');
  else
    startp = interp1([rlist(i+1) rlist(i)], [plist(i+1) plist(i)], rtarget, 'linear');
  end
end