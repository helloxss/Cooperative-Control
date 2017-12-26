function [X,Y,Z]=rotateBFtoGF(X,Y,Z,phi,theta,psi)
  % define rotation matrix
  R_roll = [...
          1, 0, 0;...
          0, cos(phi), -sin(phi);...
          0, sin(phi), cos(phi)];
  R_pitch = [...
          cos(theta), 0, sin(theta);...
          0, 1, 0;...
          -sin(theta), 0, cos(theta)];
  R_yaw = [...
          cos(psi), -sin(psi), 0;...
          sin(psi), cos(psi), 0;...
          0, 0, 1];
  R = R_roll'*R_pitch'*R_yaw';

  % rotate vertices
  B=size(X);
  
  for i=1:B(2)*B(1)
  pts = [X(i), Y(i), Z(i)]*R;
  
  X(i) = pts(:,1);
  Y(i) = pts(:,2);
  Z(i) = pts(:,3);
  end
end