function [J,A,B] = giveJacobian(linkPos,platSize,eePos,jointVars)
%Function to generate the Jacobian of the Manipulator

% Geometry
[a3,delta] = callGeometry(platSize);

% jointVars = iKinSolve(linkPos,platSize,eePos);

% Construct A and B matrices
for k=1:4
    A(k,:) = [1,0,-a3*sin(eePos(3)+delta(k))];
    A(k+4,:) = [0,1,a3*cos(eePos(3)+delta(k))];
    B(k,k) = -jointVars(2,k)*sin(jointVars(1,k));
    B(k+4,k+4) = sin(jointVars(1,k));
    B(k+4,k) = jointVars(2,k)*cos(jointVars(1,k));
    B(k,k+4) = cos(jointVars(1,k));
end

% J is a 3x8 matrix
J = pinv(A)*B;


end
